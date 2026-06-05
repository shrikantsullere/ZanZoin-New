import * as missionService from '../services/mission.service.js';
import { sendResponse } from '../utils/response.js';

export const createMission = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToUse = isSuperAdmin ? (req.body.tenantId || req.user.tenantId) : req.user.tenantId;

    const mission = await missionService.createMission(req.body, req.user.id, tenantIdToUse);
    sendResponse(res, 201, 'Mission created successfully', mission);
  } catch (error) {
    next(error);
  }
};

export const getMissions = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin && !req.query.tenantId ? null : (req.query.tenantId ? Number(req.query.tenantId) : req.user.tenantId);

    const result = await missionService.getMissions(tenantIdToFilter, req.query);
    sendResponse(res, 200, 'Missions fetched successfully', result);
  } catch (error) {
    next(error);
  }
};

export const getMissionById = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    const mission = await missionService.getMissionById(Number(req.params.id), tenantIdToFilter);
    sendResponse(res, 200, 'Mission fetched successfully', mission);
  } catch (error) {
    next(error);
  }
};

export const startMission = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    await missionService.startMission(Number(req.params.id), tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Mission started and delivery dispatched successfully');
  } catch (error) {
    next(error);
  }
};

export const submitPOD = async (req, res, next) => {
  try {
    const isSuperAdmin = req.user.role?.name === 'SUPER_ADMIN';
    const tenantIdToFilter = isSuperAdmin ? null : req.user.tenantId;

    await missionService.submitPOD(Number(req.params.id), req.body, tenantIdToFilter, req.user.id);
    sendResponse(res, 200, 'Proof of Delivery submitted and mission completed successfully');
  } catch (error) {
    next(error);
  }
};
