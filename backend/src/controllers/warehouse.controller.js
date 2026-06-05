import * as warehouseService from '../services/warehouse.service.js';
import { sendResponse } from '../utils/response.js';

export const createWarehouse = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToUse = isSuperAdmin ? (req.body.tenantId || req.user.tenantId) : req.user.tenantId;

    const warehouse = await warehouseService.createWarehouse(req.body, req.user.id, tenantIdToUse);
    sendResponse(res, 201, 'Warehouse created successfully', warehouse);
  } catch (error) {
    next(error);
  }
};

export const getWarehouses = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin && !req.query.tenantId ? null : (req.query.tenantId ? Number(req.query.tenantId) : req.user.tenantId);

    const result = await warehouseService.getWarehouses(tenantIdToFilter, req.query);
    sendResponse(res, 200, 'Warehouses fetched successfully', result);
  } catch (error) {
    next(error);
  }
};

export const getWarehouseById = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const warehouse = await warehouseService.getWarehouseById(Number(req.params.id), tenantIdToFilter);
    sendResponse(res, 200, 'Warehouse fetched successfully', warehouse);
  } catch (error) {
    next(error);
  }
};

export const updateWarehouse = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const updatedWarehouse = await warehouseService.updateWarehouse(Number(req.params.id), req.body, tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Warehouse updated successfully', updatedWarehouse);
  } catch (error) {
    next(error);
  }
};

export const deleteWarehouse = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    await warehouseService.deleteWarehouse(Number(req.params.id), tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Warehouse deleted successfully');
  } catch (error) {
    next(error);
  }
};
