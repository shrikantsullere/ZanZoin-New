import jwt from 'jsonwebtoken';
import { sendResponse } from '../utils/response.js';
import { config } from '../config/env.js';
import prisma from '../config/db.js';

const MENU_NAME_MAPPING = {
  'ORDERS': 'Orders',
  'PROJECTS': 'Projects',
  'MISSIONS': 'Missions',
  'DELIVERIES': 'Deliveries',
  'USERS': 'Personnel',
  'ROLES': 'Security',
  'PERMISSIONS': 'Security',
  'INVOICES': 'Invoices',
  'CLIENTS': 'Clients',
  'ITEMS': 'Inventory',
  'WAREHOUSES': 'Warehouses',
  'STOCK': 'Inventory',
  'GRN': 'Warehouses',
  'VENDORS': 'Vendors',
  'PURCHASE_REQUESTS': 'Purchase Requests',
  'QUOTATIONS': 'Quotes',
  'PURCHASE_ORDERS': 'Purchase Orders',
  'RFQS': 'Quotes',
  'PAYMENTS': 'Payments',
  'RECEIPTS': 'Payments',
  'PLANS': 'Plans',
  'SETTINGS': 'Settings',
  'TENANTS': 'Tenants', 
  'SUBSCRIPTIONS': 'Subscriptions',
  'ORGANIZATIONS': 'Organizations',
  'DEPARTMENTS': 'Personnel',
  'DESIGNATIONS': 'Personnel',
  'EMPLOYEES': 'Personnel',
  'EMPLOYEE_DOCUMENTS': 'Personnel'
};

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

export const checkPermission = (routeIdentifier, action) => {
  return async (req, res, next) => {
    try {
      const { roleId } = req.user;
      const roleName = req.user.role?.name || 'UNKNOWN';

      const implicitModules = ['NOTIFICATIONS', 'PROFILE', 'AUTH', 'SYSTEM'];
      if (implicitModules.includes(routeIdentifier)) {
        console.log(`[RBAC] Role: ${roleName} | Route: ${routeIdentifier} | Action: ${action} | Result: ALLOWED (Implicit)`);
        return next();
      }

      const isCustomer = ['BUSINESS_CLIENT', 'INDIVIDUAL_CLIENT'].includes(roleName);
      if (isCustomer && action === 'READ' && ['ORDERS', 'CLIENTS', 'USERS'].includes(routeIdentifier)) {
        console.log(`[RBAC] Role: ${roleName} | Route: ${routeIdentifier} | Action: READ | Result: ALLOWED (Customer Bypass)`);
        return next();
      }

      const mappedMenuName = MENU_NAME_MAPPING[routeIdentifier];
      let hasAccess = false;

      if (mappedMenuName) {
        const roleMenu = await prisma.roleMenu.findFirst({
          where: {
            roleId,
            menu: { name: mappedMenuName }
          }
        });

        if (roleMenu) {
          switch (action) {
            case 'READ': hasAccess = roleMenu.can_view; break;
            case 'CREATE': hasAccess = roleMenu.can_add; break;
            case 'UPDATE': hasAccess = roleMenu.can_edit; break;
            case 'DELETE': hasAccess = roleMenu.can_delete; break;
            case 'MANAGE': hasAccess = roleMenu.can_edit || roleMenu.can_add; break;
            default: hasAccess = roleMenu.can_edit; break; // ADJUST, TRANSFER, ASSIGN_PERMISSIONS etc.
          }
        }
      }

      const isSuperAdmin = roleName === 'SUPER_ADMIN' || roleName === 'superadmin';
      
      if (!hasAccess && !isSuperAdmin) {
        // Implicit read-only bypass for internal staff roles to load dropdowns/lookups
        const staffRoles = ['admin', 'operations', 'procurement', 'logistics', 'inventory', 'concierge', 'staff'];
        const isStaff = staffRoles.includes(roleName.toLowerCase());
        
        if (action === 'READ' && ['ORDERS', 'CLIENTS', 'USERS'].includes(routeIdentifier) && isStaff) {
          console.log(`[RBAC] Role: ${roleName} | Route: ${routeIdentifier} | Action: ${action} | Result: ALLOWED (Staff Lookup Bypass)`);
          return next();
        }

        console.log(`[RBAC] Role: ${roleName} | Route: ${routeIdentifier} | Mapped Menu: ${mappedMenuName || 'UNMAPPED'} | Action: ${action} | Result: DENIED`);
        return sendResponse(res, 403, 'Forbidden: Insufficient permissions for this action');
      }

      const resultStr = isSuperAdmin && !hasAccess ? 'ALLOWED (Super Admin Bypass)' : 'ALLOWED';
      console.log(`[RBAC] Role: ${roleName} | Route: ${routeIdentifier} | Mapped Menu: ${mappedMenuName || 'UNMAPPED'} | Action: ${action} | Result: ${resultStr}`);
      
      next();
    } catch (error) {
      console.error(`[RBAC Error]`, error);
      return sendResponse(res, 500, 'Error checking permissions');
    }
  };
};
