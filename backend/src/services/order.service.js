import * as orderRepo from '../repositories/order.repository.js';
import * as clientRepo from '../repositories/client.repository.js';
import * as employeeRepo from '../repositories/employee.repository.js';
import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { logAudit } from '../utils/audit.js';

// --- Order Reservation Engine ---

const validateAndReserveStock = async (tx, items) => {
  const itemsArray = items || [];
  for (const item of itemsArray) {
    const stock = await tx.inventoryStock.findUnique({
      where: { warehouseId_itemId: { warehouseId: item.warehouseId, itemId: item.itemId } }
    });

    if (!stock) {
      throw new AppError(`Stock record not found for Item ${item.itemId} in Warehouse ${item.warehouseId}`, 400);
    }

    const availableQuantity = stock.quantity - stock.reservedQuantity;
    if (availableQuantity < item.quantity) {
      throw new AppError(`Insufficient stock for Item ${item.itemId}. Available: ${availableQuantity}, Requested: ${item.quantity}`, 400);
    }

    // Reserve stock
    await tx.inventoryStock.update({
      where: { id: stock.id },
      data: { reservedQuantity: { increment: item.quantity } }
    });
  }
};

const releaseReservedStock = async (tx, items) => {
  const itemsArray = items || [];
  for (const item of itemsArray) {
    const stock = await tx.inventoryStock.findUnique({
      where: { warehouseId_itemId: { warehouseId: item.warehouseId, itemId: item.itemId } }
    });

    if (stock) {
      // Ensure we don't drop below 0 by releasing too much (sanity check)
      const decrementVal = Math.min(stock.reservedQuantity, item.quantity);
      await tx.inventoryStock.update({
        where: { id: stock.id },
        data: { reservedQuantity: { decrement: decrementVal } }
      });
    }
  }
};

// --- Order Methods ---

export const createOrder = async (data, performerId, tenantId) => {
  const { items, ...orderData } = data;

  const validOrderItems = [];
  const customItems = [];

  if (items && Array.isArray(items)) {
    for (const item of items) {
      if (item.itemId && item.warehouseId) {
        validOrderItems.push({
            itemId: Number(item.itemId),
            warehouseId: Number(item.warehouseId),
            quantity: Number(item.quantity || item.qty || 1),
            unitPrice: Number(item.unitPrice || item.price || 0)
        });
      } else {
        customItems.push(item);
      }
    }
  }

  if (customItems.length > 0) {
    orderData.metadata = {
      ...(orderData.metadata || {}),
      customItems
    };
  }

  const client = await clientRepo.findClientById(data.clientId);
  if (!client || (tenantId !== null && client.tenantId !== tenantId)) {
    throw new AppError('Client not found', 404);
  }

  // Fetch employee creator ID
  const employee = await prisma.employee.findUnique({ where: { userId: performerId } });
  if (!employee) {
    throw new AppError('Only mapped employees can create orders', 403);
  }

  orderData.createdById = employee.id;
  orderData.status = 'draft';

  const newOrder = await orderRepo.createOrder(orderData, validOrderItems, tenantId);

  await logAudit({
    module: 'ORDERS',
    action: 'CREATE',
    description: `Created Order ${newOrder.orderNumber} for Client ${client.companyName}`,
    newValue: newOrder,
    performedBy: performerId
  });

  return newOrder;
};

export const getOrders = async (tenantId, query) => {
  return await orderRepo.findAllOrders(tenantId, query);
};

export const getOrderById = async (id, tenantId) => {
  const order = await orderRepo.findOrderById(id);
  if (!order || (tenantId !== null && order.tenantId !== tenantId)) {
    throw new AppError('Order not found', 404);
  }
  return order;
};

export const updateOrderStatus = async (id, status, tenantId, performerId) => {
  const order = await getOrderById(id, tenantId);

  if (order.status === 'cancelled') {
    throw new AppError('Cannot update a cancelled order', 400);
  }

  const validTransitions = {
    'draft': ['submitted', 'cancelled'],
    'submitted': ['review', 'rejected', 'cancelled'],
    'review': ['approved', 'rejected', 'cancelled'],
    'approved': ['ready_for_delivery', 'cancelled'], // If cancelled from approved, must release stock
    'ready_for_delivery': [],
    'rejected': [],
    'cancelled': []
  };

  if (!validTransitions[order.status].includes(status)) {
    throw new AppError(`Invalid Order status transition from ${order.status} to ${status}`, 400);
  }

  let updatedOrder;

  await prisma.$transaction(async (tx) => {
    // If transitioning TO approved, Reserve Stock
    if (status === 'approved') {
      await validateAndReserveStock(tx, order.items);
    }

    // If transitioning FROM approved TO cancelled, Release Stock
    if (order.status === 'approved' && status === 'cancelled') {
      await releaseReservedStock(tx, order.items);
    }

    // Update the actual order status
    updatedOrder = await tx.order.update({
      where: { id },
      data: { status }
    });
  });

  await logAudit({
    module: 'ORDERS',
    action: 'STATUS_CHANGE',
    description: `Order ${order.orderNumber} status changed to ${status}`,
    oldValue: order,
    newValue: updatedOrder,
    performedBy: performerId
  });

  return updatedOrder;
};

export const deleteOrder = async (id, tenantId, performerId) => {
  const order = await getOrderById(id, tenantId);

  if (order.status !== 'draft') {
    throw new AppError(`Cannot delete order in ${order.status} status. Cancel it instead.`, 400);
  }

  await orderRepo.deleteOrder(id);

  await logAudit({
    module: 'ORDERS',
    action: 'DELETE',
    description: `Deleted Order ${order.orderNumber}`,
    oldValue: order,
    performedBy: performerId
  });

  return true;
};
