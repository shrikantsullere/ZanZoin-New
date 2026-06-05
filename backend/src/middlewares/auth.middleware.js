import jwt from 'jsonwebtoken';
import { sendResponse } from '../utils/response.js';
import { config } from '../config/env.js';
import prisma from '../config/db.js';

export const authenticate = async (req, res, next) => {
  try {
    const token = req.headers.authorization?.split(' ')[1];

    if (!token) {
      return sendResponse(res, 401, 'Authentication required');
    }

    const decoded = jwt.verify(token, config.jwtSecret);
    
    // Verify user exists and fetch role
    const user = await prisma.user.findFirst({
      where: { id: decoded.id, deletedAt: null },
      include: { role: true }
    });

    if (!user) {
       return sendResponse(res, 401, 'User no longer exists');
    }

    req.user = user;
    next();
  } catch (error) {
    return sendResponse(res, 401, 'Invalid or expired token');
  }
};

export const authorize = (allowedRoles) => {
  return async (req, res, next) => {
    try {
      const userRole = req.user.role;

      if (!userRole || !allowedRoles.includes(userRole.name)) {
        return sendResponse(res, 403, 'Forbidden: You do not have the required role');
      }

      next();
    } catch (error) {
      return sendResponse(res, 500, 'Error authorizing user');
    }
  };
};

export const checkPermission = (moduleName, action) => {
  return async (req, res, next) => {
    try {
      const { roleId } = req.user;

      const hasPermission = await prisma.rolePermission.findFirst({
        where: {
          roleId,
          permission: { 
            module: moduleName, 
            OR: [
              { action },
              { action: 'MANAGE' }
            ]
          }
        }
      });

      if (!hasPermission) {
        return sendResponse(res, 403, 'Forbidden: Insufficient permissions for this action');
      }

      next();
    } catch (error) {
      return sendResponse(res, 500, 'Error checking permissions');
    }
  };
};
