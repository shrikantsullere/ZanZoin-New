import * as vendorService from '../services/vendor.service.js';
import { sendResponse } from '../utils/response.js';

export const createVendor = async (req, res, next) => {
  try {
    const vendor = await vendorService.createVendor(req.body, req.user.id, req.user.tenantId);
    sendResponse(res, 201, 'Vendor created successfully', vendor);
  } catch (error) {
    next(error);
  }
};

export const getVendors = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin && !req.query.tenantId ? null : (req.query.tenantId ? Number(req.query.tenantId) : req.user.tenantId);

    const result = await vendorService.getVendors(tenantIdToFilter, req.query);
    sendResponse(res, 200, 'Vendors fetched successfully', result);
  } catch (error) {
    next(error);
  }
};

export const getVendorById = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const vendor = await vendorService.getVendorById(Number(req.params.id), tenantIdToFilter);
    sendResponse(res, 200, 'Vendor fetched successfully', vendor);
  } catch (error) {
    next(error);
  }
};

export const updateVendor = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const updatedVendor = await vendorService.updateVendor(Number(req.params.id), req.body, tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Vendor updated successfully', updatedVendor);
  } catch (error) {
    next(error);
  }
};

export const deleteVendor = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    await vendorService.deleteVendor(Number(req.params.id), tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Vendor deleted successfully');
  } catch (error) {
    next(error);
  }
};
