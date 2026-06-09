import * as quotationService from '../services/quotation.service.js';
import { sendResponse } from '../utils/response.js';

export const createQuotation = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToUse = isSuperAdmin ? (req.body.tenantId || req.user.tenantId || 1) : (req.user.tenantId || 1);

    const quotation = await quotationService.createQuotation(req.body, req.user.id, tenantIdToUse);
    sendResponse(res, 201, 'Quotation submitted successfully', quotation);
  } catch (error) {
    next(error);
  }
};

export const getQuotations = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin && !req.query.tenantId ? null : (req.query.tenantId ? Number(req.query.tenantId) : req.user.tenantId);

    const result = await quotationService.getQuotations(tenantIdToFilter, req.query);
    sendResponse(res, 200, 'Quotations fetched successfully', result);
  } catch (error) {
    next(error);
  }
};

export const getQuotationById = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const quotation = await quotationService.getQuotationById(Number(req.params.id), tenantIdToFilter);
    sendResponse(res, 200, 'Quotation fetched successfully', quotation);
  } catch (error) {
    next(error);
  }
};

export const updateQuotationStatus = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;
    const { status } = req.body;

    const updatedQuotation = await quotationService.updateQuotationStatus(Number(req.params.id), status, tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Quotation status updated successfully', updatedQuotation);
  } catch (error) {
    next(error);
  }
};

export const deleteQuotation = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    await quotationService.deleteQuotation(Number(req.params.id), tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Quotation deleted successfully');
  } catch (error) {
    next(error);
  }
};
