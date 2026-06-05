import * as missionRepo from '../repositories/mission.repository.js';
import * as deliveryRepo from '../repositories/delivery.repository.js';
import * as employeeRepo from '../repositories/employee.repository.js';
import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { logAudit } from '../utils/audit.js';

export const createMission = async (data, performerId, tenantId) => {
  const delivery = await deliveryRepo.findDeliveryById(data.deliveryId);
  if (!delivery || (tenantId !== null && delivery.tenantId !== tenantId)) {
    throw new AppError('Delivery not found', 404);
  }

  if (delivery.status !== 'pending') {
    throw new AppError(`Cannot assign a mission for a delivery in ${delivery.status} status`, 400);
  }

  const employee = await employeeRepo.findEmployeeById(data.assignedEmployeeId);
  if (!employee || (tenantId !== null && employee.tenantId !== tenantId)) {
    throw new AppError('Employee not found or unauthorized', 404);
  }

  const newMission = await missionRepo.createMission(data, tenantId);

  await logAudit({
    module: 'MISSIONS',
    action: 'CREATE',
    description: `Assigned Mission ${newMission.missionNumber} to ${employee.firstName} ${employee.lastName}`,
    newValue: newMission,
    performedBy: performerId
  });

  return newMission;
};

export const startMission = async (id, tenantId, performerId) => {
  const mission = await missionRepo.findMissionById(id);
  if (!mission || (tenantId !== null && mission.tenantId !== tenantId)) throw new AppError('Mission not found', 404);

  if (mission.status !== 'assigned') throw new AppError(`Cannot start a mission in ${mission.status} status`, 400);

  const delivery = mission.delivery;

  await prisma.$transaction(async (tx) => {
    // 1. Update Mission
    await missionRepo.updateMissionStatus(tx, id, 'in_progress', { startDate: new Date() });
    
    // 2. Update Delivery
    await deliveryRepo.updateDeliveryStatus(tx, delivery.id, 'dispatched', { dispatchDate: new Date() });

    // 3. Dispatch Engine: Deduct Inventory Stock (Quantity & Reserved)
    for (const item of delivery.items) {
      const stock = await tx.inventoryStock.findUnique({
        where: { warehouseId_itemId: { warehouseId: delivery.warehouseId, itemId: item.itemId } }
      });

      if (!stock || stock.quantity < item.quantity || stock.reservedQuantity < item.quantity) {
         throw new AppError(`Critical Error: Insufficient physical or reserved stock for Item ${item.itemId} during dispatch.`, 500);
      }

      await tx.inventoryStock.update({
        where: { id: stock.id },
        data: {
          quantity: { decrement: item.quantity },
          reservedQuantity: { decrement: item.quantity }
        }
      });

      // Log Stock Movement
      await tx.stockMovement.create({
        data: {
          tenantId: delivery.tenantId,
          warehouseId: delivery.warehouseId,
          itemId: item.itemId,
          movementType: 'OUT',
          quantity: item.quantity,
          referenceType: 'DELIVERY',
          remarks: `Dispatched via Mission ${mission.missionNumber} (Delivery ID: ${delivery.id})`
        }
      });
    }
  });

  await logAudit({
    module: 'MISSIONS',
    action: 'START',
    description: `Mission ${mission.missionNumber} started. Delivery ${delivery.deliveryNumber} dispatched.`,
    performedBy: performerId
  });

  return true;
};

export const submitPOD = async (id, podData, tenantId, performerId) => {
  const mission = await missionRepo.findMissionById(id);
  if (!mission || (tenantId !== null && mission.tenantId !== tenantId)) throw new AppError('Mission not found', 404);

  if (mission.status !== 'in_progress') throw new AppError(`Cannot complete a mission in ${mission.status} status`, 400);

  await prisma.$transaction(async (tx) => {
    // 1. Create POD
    await missionRepo.createPOD(tx, mission.deliveryId, mission.tenantId, podData);

    // 2. Update Mission
    await missionRepo.updateMissionStatus(tx, id, 'completed', { endDate: new Date() });
    
    // 3. Update Delivery
    await deliveryRepo.updateDeliveryStatus(tx, mission.deliveryId, 'delivered', { deliveryDate: new Date() });
  });

  await logAudit({
    module: 'MISSIONS',
    action: 'COMPLETE',
    description: `Mission ${mission.missionNumber} completed. POD Submitted.`,
    performedBy: performerId
  });

  return true;
};

export const getMissions = async (tenantId, query) => {
  return await missionRepo.findAllMissions(tenantId, query);
};

export const getMissionById = async (id, tenantId) => {
  const mission = await missionRepo.findMissionById(id);
  if (!mission || (tenantId !== null && mission.tenantId !== tenantId)) throw new AppError('Mission not found', 404);
  return mission;
};
