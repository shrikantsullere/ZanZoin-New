import * as clientService from '../services/client.service.js';
import { sendResponse } from '../utils/response.js';

export const createClient = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToUse = isSuperAdmin ? (req.body.tenantId || req.user.tenantId) : req.user.tenantId;

    const client = await clientService.createClient(req.body, req.user.id, tenantIdToUse);
    sendResponse(res, 201, 'Client created successfully', client);
  } catch (error) {
    next(error);
  }
};

export const getClients = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin && !req.query.tenantId ? null : (req.query.tenantId ? Number(req.query.tenantId) : req.user.tenantId);

    const result = await clientService.getClients(tenantIdToFilter, req.query);
    sendResponse(res, 200, 'Clients fetched successfully', result);
  } catch (error) {
    next(error);
  }
};

export const getClientById = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const client = await clientService.getClientById(Number(req.params.id), tenantIdToFilter);
    sendResponse(res, 200, 'Client fetched successfully', client);
  } catch (error) {
    next(error);
  }
};

export const updateClient = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const updatedClient = await clientService.updateClient(Number(req.params.id), req.body, tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Client updated successfully', updatedClient);
  } catch (error) {
    next(error);
  }
};

export const deleteClient = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    await clientService.deleteClient(Number(req.params.id), tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Client deleted successfully');
  } catch (error) {
    next(error);
  }
};

export const addClientContact = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToUse = isSuperAdmin ? null : req.user.tenantId;

    const contact = await clientService.addClientContact(Number(req.params.id), req.body, req.user.id, tenantIdToUse);
    sendResponse(res, 201, 'Client contact added successfully', contact);
  } catch (error) {
    next(error);
  }
};

export const removeClientContact = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToUse = isSuperAdmin ? null : req.user.tenantId;

    await clientService.removeClientContact(Number(req.params.id), Number(req.params.contactId), req.user.id, tenantIdToUse);
    sendResponse(res, 200, 'Client contact removed successfully');
  } catch (error) {
    next(error);
  }
};
