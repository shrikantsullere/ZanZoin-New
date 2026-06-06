import * as userService from '../services/user.service.js';
import { sendResponse } from '../utils/response.js';

export const createUser = async (req, res, next) => {
  try {
    const data = req.body;
    // ensure tenant isolation
    data.tenantId = req.user.tenantId; 

    const user = await userService.createUser(
      data, 
      req.user.id, 
      req.ip, 
      req.headers['user-agent']
    );

    sendResponse(res, 201, 'User created successfully', user);
  } catch (error) {
    next(error);
  }
};

export const getUsers = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const result = await userService.getUsers(tenantIdToFilter, req.query);
    sendResponse(res, 200, 'Users fetched successfully', result);
  } catch (error) {
    next(error);
  }
};

export const getCustomers = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    // A "customer" is effectively a user with role = BUSINESS_CLIENT
    // The frontend passes include_client_role=1 or roleName=BUSINESS_CLIENT. 
    // We can just reuse userService.getUsers with a hardcoded role check if needed, 
    // or just let it pass through req.query to the repo.
    const query = { ...req.query, roleName: 'BUSINESS_CLIENT' };
    const result = await userService.getUsers(tenantIdToFilter, query);
    
    sendResponse(res, 200, 'Customers fetched successfully', result);
  } catch (error) {
    next(error);
  }
};

export const getUserById = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const user = await userService.getUserById(Number(req.params.id), tenantIdToFilter);
    sendResponse(res, 200, 'User fetched successfully', user);
  } catch (error) {
    next(error);
  }
};

export const updateUser = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const updatedUser = await userService.updateUser(Number(req.params.id), req.body, tenantIdToFilter, req.ip, req.headers['user-agent']);
    sendResponse(res, 200, 'User updated successfully', updatedUser);
  } catch (error) {
    next(error);
  }
};

export const deleteUser = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    await userService.deleteUser(Number(req.params.id), tenantIdToFilter, req.ip, req.headers['user-agent']);
    sendResponse(res, 200, 'User deleted successfully');
  } catch (error) {
    next(error);
  }
};
