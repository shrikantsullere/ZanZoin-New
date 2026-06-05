import * as invoiceRepo from '../repositories/invoice.repository.js';
import * as deliveryRepo from '../repositories/delivery.repository.js';
import AppError from '../utils/AppError.js';
import { logAudit } from '../utils/audit.js';

export const generateInvoice = async (data, performerId, tenantId) => {
  const { items, deliveryId, dueDate } = data;

  const delivery = await deliveryRepo.findDeliveryById(deliveryId);
  if (!delivery || (tenantId !== null && delivery.tenantId !== tenantId)) {
    throw new AppError('Delivery not found', 404);
  }

  if (delivery.status !== 'delivered') {
    throw new AppError(`Flow Dependency Error: Cannot generate invoice. Delivery ${delivery.deliveryNumber || deliveryId} is currently '${delivery.status}'. Required Next Step: Complete the delivery and update its status to 'delivered'.`, 400);
  }

  const pod = await invoiceRepo.checkPODExists(deliveryId);
  if (!pod) {
    throw new AppError(`Flow Dependency Error: Missing Proof of Delivery (POD). Required Next Step: Upload and submit the POD document for Delivery ${delivery.deliveryNumber || deliveryId} before generating an invoice.`, 400);
  }

  // Validate quantities against what was actually delivered
  for (const item of items) {
    const deliveredItem = delivery.items.find(di => di.itemId === item.itemId);
    if (!deliveredItem) {
      throw new AppError(`Item ${item.itemId} was not part of this delivery`, 400);
    }
    if (item.quantity !== deliveredItem.quantity) {
      throw new AppError(`Invoice quantity for item ${item.itemId} (${item.quantity}) does not match delivered quantity (${deliveredItem.quantity})`, 400);
    }
  }

  const invoiceData = {
    clientId: delivery.clientId,
    orderId: delivery.orderId,
    deliveryId: delivery.id,
    invoiceDate: new Date(),
    dueDate: new Date(dueDate)
  };

  const newInvoice = await invoiceRepo.createInvoice(invoiceData, items, tenantId);

  await logAudit({
    module: 'INVOICES',
    action: 'CREATE',
    description: `Generated Invoice ${newInvoice.invoiceNumber} for Delivery ${delivery.deliveryNumber}`,
    newValue: newInvoice,
    performedBy: performerId
  });

  return newInvoice;
};

export const getInvoices = async (tenantId, query) => {
  return await invoiceRepo.findAllInvoices(tenantId, query);
};

export const getInvoiceById = async (id, tenantId) => {
  const invoice = await invoiceRepo.findInvoiceById(id);
  if (!invoice || (tenantId !== null && invoice.tenantId !== tenantId)) {
    throw new AppError('Invoice not found', 404);
  }
  return invoice;
};

export const updateInvoiceStatus = async (id, status, tenantId, performerId) => {
  const invoice = await getInvoiceById(id, tenantId);

  const validTransitions = {
    'draft': ['generated', 'cancelled'],
    'generated': ['approved', 'cancelled'],
    'approved': ['sent', 'cancelled'],
    'sent': ['partially_paid', 'paid', 'cancelled'],
    'partially_paid': ['paid'],
    'paid': [],
    'cancelled': []
  };

  if (!validTransitions[invoice.status].includes(status)) {
    throw new AppError(`Invalid invoice status transition from ${invoice.status} to ${status}`, 400);
  }

  const updatedInvoice = await invoiceRepo.updateInvoiceStatus(id, status);

  await logAudit({
    module: 'INVOICES',
    action: 'STATUS_CHANGE',
    description: `Invoice ${invoice.invoiceNumber} status changed to ${status}`,
    oldValue: invoice,
    newValue: updatedInvoice,
    performedBy: performerId
  });

  return updatedInvoice;
};
