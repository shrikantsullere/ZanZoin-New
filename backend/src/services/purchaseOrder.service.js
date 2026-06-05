import * as poRepository from '../repositories/purchaseOrder.repository.js';
import * as prRepository from '../repositories/purchaseRequest.repository.js';
import * as quotationRepository from '../repositories/quotation.repository.js';
import * as vendorRepository from '../repositories/vendor.repository.js';
import AppError from '../utils/AppError.js';
import { logAudit } from '../utils/audit.js';

export const createPurchaseOrder = async (data, performerId, tenantId) => {
  const pr = await prRepository.findPurchaseRequestById(data.purchaseRequestId);
  if (!pr || (tenantId !== null && pr.tenantId !== tenantId)) {
    throw new AppError('Purchase Request not found', 404);
  }

  // Allow PO creation if PR is approved or already in rfq_created status
  if (!['approved', 'rfq_created'].includes(pr.status)) {
    throw new AppError(`Cannot create PO for PR in ${pr.status} status. PR must be approved.`, 400);
  }

  const vendor = await vendorRepository.findVendorById(data.vendorId);
  if (!vendor || (tenantId !== null && vendor.tenantId !== tenantId)) {
    throw new AppError('Vendor not found', 404);
  }

  if (data.quotationId) {
    const quotation = await quotationRepository.findQuotationById(data.quotationId);
    if (!quotation || (tenantId !== null && quotation.tenantId !== tenantId)) {
      throw new AppError('Quotation not found', 404);
    }
    if (quotation.status !== 'approved') {
      throw new AppError('Quotation must be approved to create a PO', 400);
    }
    if (quotation.rfq.purchaseRequestId !== data.purchaseRequestId) {
      throw new AppError('Quotation does not belong to this Purchase Request', 400);
    }
    if (quotation.vendorId !== data.vendorId) {
      throw new AppError('Quotation vendor does not match the requested Vendor', 400);
    }
  }

  const newPO = await poRepository.createPurchaseOrder({ ...data, tenantId });

  await logAudit({
    module: 'PURCHASE_ORDERS',
    action: 'CREATE',
    description: `Created PO ${newPO.poNumber} for Vendor ${vendor.companyName}`,
    newValue: newPO,
    performedBy: performerId
  });

  return newPO;
};

export const getPurchaseOrders = async (tenantId, query) => {
  return await poRepository.findAllPurchaseOrders(tenantId, query);
};

export const getPurchaseOrderById = async (id, tenantId) => {
  const po = await poRepository.findPurchaseOrderById(id);
  if (!po || (tenantId !== null && po.tenantId !== tenantId)) {
    throw new AppError('Purchase Order not found', 404);
  }
  return po;
};

export const updatePurchaseOrderStatus = async (id, status, tenantId, performerId) => {
  const po = await getPurchaseOrderById(id, tenantId);

  const validTransitions = {
    'draft': ['approved', 'rejected', 'cancelled'],
    'approved': ['waiting_for_delivery', 'cancelled'],
    'waiting_for_delivery': [],
    'rejected': [],
    'cancelled': []
  };

  if (!validTransitions[po.status].includes(status)) {
    throw new AppError(`Invalid PO status transition from ${po.status} to ${status}`, 400);
  }

  const updatedPO = await poRepository.updatePurchaseOrderStatus(id, status);

  await logAudit({
    module: 'PURCHASE_ORDERS',
    action: 'STATUS_CHANGE',
    description: `PO ${po.poNumber} status changed to ${status}`,
    oldValue: po,
    newValue: updatedPO,
    performedBy: performerId
  });

  return updatedPO;
};

export const deletePurchaseOrder = async (id, tenantId, performerId) => {
  const po = await getPurchaseOrderById(id, tenantId);

  if (po.status !== 'draft' && po.status !== 'cancelled') {
    throw new AppError(`Cannot delete PO in ${po.status} status`, 400);
  }

  await poRepository.deletePurchaseOrder(id);

  await logAudit({
    module: 'PURCHASE_ORDERS',
    action: 'DELETE',
    description: `Deleted PO ${po.poNumber}`,
    oldValue: po,
    performedBy: performerId
  });

  return true;
};
