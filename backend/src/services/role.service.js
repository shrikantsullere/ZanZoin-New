import * as roleRepository from '../repositories/role.repository.js';
import AppError from '../utils/AppError.js';
import { logAudit } from '../utils/audit.js';

export const createRole = async (data, performerId) => {
  const exists = await roleRepository.findRoleByName(data.name);
  if (exists) throw new AppError('Role with this name already exists', 400);

  const role = await roleRepository.createRole(data);
  
  await logAudit({
    module: 'ROLES',
    action: 'CREATE',
    description: `Created role ${role.name}`,
    newValue: role,
    performedBy: performerId
  });

  return role;
};

export const getRoles = async (query) => {
  return await roleRepository.findAllRoles(query);
};

export const getRoleById = async (id) => {
  const role = await roleRepository.findRoleById(id);
  if (!role) throw new AppError('Role not found', 404);
  return role;
};

export const updateRole = async (id, data, performerId) => {
  const role = await roleRepository.findRoleById(id);
  if (!role) throw new AppError('Role not found', 404);

  const updatedRole = await roleRepository.updateRole(id, data);

  await logAudit({
    module: 'ROLES',
    action: 'UPDATE',
    description: `Updated role ${updatedRole.name}`,
    oldValue: role,
    newValue: updatedRole,
    performedBy: performerId
  });

  return updatedRole;
};

export const deleteRole = async (id, performerId) => {
  const role = await roleRepository.findRoleById(id);
  if (!role) throw new AppError('Role not found', 404);

  await roleRepository.deleteRole(id);

  await logAudit({
    module: 'ROLES',
    action: 'DELETE',
    description: `Deleted role ${role.name}`,
    oldValue: role,
    performedBy: performerId
  });

  return true;
};

export const assignPermissions = async (roleId, permissionIds, performerId) => {
  const role = await roleRepository.findRoleById(roleId);
  if (!role) throw new AppError('Role not found', 404);

  await roleRepository.assignPermissionsToRole(roleId, permissionIds);

  await logAudit({
    module: 'ROLES',
    action: 'ASSIGN_PERMISSIONS',
    description: `Assigned permissions to role ${role.name}`,
    newValue: { permissionIds },
    performedBy: performerId
  });

  return true;
};

export const removePermissions = async (roleId, permissionIds, performerId) => {
  const role = await roleRepository.findRoleById(roleId);
  if (!role) throw new AppError('Role not found', 404);

  await roleRepository.removePermissionsFromRole(roleId, permissionIds);

  await logAudit({
    module: 'ROLES',
    action: 'REMOVE_PERMISSIONS',
    description: `Removed permissions from role ${role.name}`,
    oldValue: { permissionIds },
    performedBy: performerId
  });

  return true;
};
