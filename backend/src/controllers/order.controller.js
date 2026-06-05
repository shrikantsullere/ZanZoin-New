import * as orderService from '../services/order.service.js';
import { sendResponse } from '../utils/response.js';

export const createOrder = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToUse = isSuperAdmin ? (req.body.tenantId || req.user.tenantId) : req.user.tenantId;

    const order = await orderService.createOrder(req.body, req.user.id, tenantIdToUse);
    sendResponse(res, 201, 'Order created successfully', order);
  } catch (error) {
    next(error);
  }
};

export const getOrders = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin && !req.query.tenantId ? null : (req.query.tenantId ? Number(req.query.tenantId) : req.user.tenantId);

    const result = await orderService.getOrders(tenantIdToFilter, req.query);
    sendResponse(res, 200, 'Orders fetched successfully', result);
  } catch (error) {
    next(error);
  }
};

export const getOrderById = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const order = await orderService.getOrderById(Number(req.params.id), tenantIdToFilter);
    sendResponse(res, 200, 'Order fetched successfully', order);
  } catch (error) {
    next(error);
  }
};

export const updateOrderStatus = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;
    const { status } = req.body;

    const updatedOrder = await orderService.updateOrderStatus(Number(req.params.id), status, tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Order status updated successfully', updatedOrder);
  } catch (error) {
    next(error);
  }
};

export const deleteOrder = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    await orderService.deleteOrder(Number(req.params.id), tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Order deleted successfully');
  } catch (error) {
    next(error);
  }
};
