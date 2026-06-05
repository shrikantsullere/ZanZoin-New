import * as warehouseRepo from '../repositories/warehouse.repository.js';
import * as employeeRepo from '../repositories/employee.repository.js';
import AppError from '../utils/AppError.js';
import { logAudit } from '../utils/audit.js';

export const createWarehouse = async (data, performerId, tenantId) => {
  if (data.managerId) {
    const manager = await employeeRepo.findEmployeeById(data.managerId);
    if (!manager || (tenantId !== null && manager.tenantId !== tenantId)) {
      throw new AppError('Manager Employee not found', 404);
    }
  }

  const newWarehouse = await warehouseRepo.createWarehouse({ ...data, tenantId });

  await logAudit({
    module: 'WAREHOUSES',
    action: 'CREATE',
    description: `Created Warehouse ${newWarehouse.name}`,
    newValue: newWarehouse,
    performedBy: performerId
  });

  return newWarehouse;
};

export const getWarehouses = async (tenantId, query) => {
  return await warehouseRepo.findAllWarehouses(tenantId, query);
};

export const getWarehouseById = async (id, tenantId) => {
  const warehouse = await warehouseRepo.findWarehouseById(id);
  if (!warehouse || (tenantId !== null && warehouse.tenantId !== tenantId)) {
    throw new AppError('Warehouse not found', 404);
  }
  return warehouse;
};

export const updateWarehouse = async (id, data, tenantId, performerId) => {
  const warehouse = await getWarehouseById(id, tenantId);

  if (data.managerId) {
    const manager = await employeeRepo.findEmployeeById(data.managerId);
    if (!manager || (tenantId !== null && manager.tenantId !== tenantId)) {
      throw new AppError('Manager Employee not found', 404);
    }
  }

  const updatedWarehouse = await warehouseRepo.updateWarehouse(id, data);

  await logAudit({
    module: 'WAREHOUSES',
    action: 'UPDATE',
    description: `Updated Warehouse ${warehouse.name}`,
    oldValue: warehouse,
    newValue: updatedWarehouse,
    performedBy: performerId
  });

  return updatedWarehouse;
};

export const deleteWarehouse = async (id, tenantId, performerId) => {
  const warehouse = await getWarehouseById(id, tenantId);
  await warehouseRepo.deleteWarehouse(id);

  await logAudit({
    module: 'WAREHOUSES',
    action: 'DELETE',
    description: `Deleted Warehouse ${warehouse.name}`,
    oldValue: warehouse,
    performedBy: performerId
  });

  return true;
};
