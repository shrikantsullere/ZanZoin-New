import prisma from '../config/db.js';

export const createItem = async (data) => await prisma.luxuryItem.create({ data });
export const findAllItems = async (tenantId) => await prisma.luxuryItem.findMany({ where: { ...(tenantId !== null && { tenantId }) }, orderBy: { createdAt: 'desc' } });

export const findItemById = async (itemId, tenantId) => {
  if (tenantId === null) return await prisma.luxuryItem.findFirst({ where: { itemId } });
  return await prisma.luxuryItem.findUnique({ where: { itemId_tenantId: { itemId, tenantId } } });
};

export const updateItem = async (itemId, tenantId, data) => {
  if (tenantId === null) {
    const existing = await prisma.luxuryItem.findFirst({ where: { itemId } });
    if (!existing) return null;
    return await prisma.luxuryItem.update({ where: { id: existing.id }, data });
  }
  return await prisma.luxuryItem.update({ where: { itemId_tenantId: { itemId, tenantId } }, data });
};

export const deleteItem = async (itemId, tenantId) => {
  if (tenantId === null) {
    const existing = await prisma.luxuryItem.findFirst({ where: { itemId } });
    if (!existing) return null;
    return await prisma.luxuryItem.delete({ where: { id: existing.id } });
  }
  return await prisma.luxuryItem.delete({ where: { itemId_tenantId: { itemId, tenantId } } });
};
