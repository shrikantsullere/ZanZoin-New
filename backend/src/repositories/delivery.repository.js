import prisma from '../config/db.js';

const generateDeliveryNumber = async (tenantId) => {
  const count = await prisma.delivery.count({ where: { tenantId } });
  return `DEL-${new Date().getFullYear()}-${String(count + 1).padStart(4, '0')}`;
};

export const createDelivery = async (data, items, tenantId) => {
  return await prisma.$transaction(async (tx) => {
    const deliveryNumber = await generateDeliveryNumber(tenantId);
    
    return await tx.delivery.create({
      data: {
        ...data,
        deliveryNumber,
        tenantId,
        items: {
          create: items.map(item => ({
            ...item,
            tenantId
          }))
        }
      },
      include: { items: true, client: true, order: true }
    });
  });
};

export const findDeliveryById = async (id) => {
  return await prisma.delivery.findUnique({
    where: { id },
    include: {
      items: { include: { item: true, orderItem: true } },
      client: true,
      order: true,
      assignee: { select: { firstName: true, lastName: true } },
      warehouse: { select: { name: true } },
      missions: true,
      proofs: true
    }
  });
};

export const findAllDeliveries = async (tenantId, query) => {
  const { page = 1, limit = 10, search = '', status, warehouseId, assignedTo } = query;
  const skip = (page - 1) * limit;

  const where = {
    ...(tenantId !== null && { tenantId }),
    ...(search && { deliveryNumber: { contains: search } }),
    ...(status && { status }),
    ...(warehouseId && { warehouseId: Number(warehouseId) }),
    ...(assignedTo && { assignedTo: Number(assignedTo) })
  };

  const [deliveries, total] = await Promise.all([
    prisma.delivery.findMany({
      where,
      skip: Number(skip),
      take: Number(limit),
      orderBy: { createdAt: 'desc' },
      include: {
        client: { select: { companyName: true } },
        order: { select: { orderNumber: true } },
        assignee: { select: { firstName: true, lastName: true } }
      }
    }),
    prisma.delivery.count({ where })
  ]);

  return { deliveries, total, page: Number(page), totalPages: Math.ceil(total / limit) };
};

export const updateDeliveryStatus = async (tx, id, status, extraData = {}) => {
  return await tx.delivery.update({
    where: { id },
    data: { status, ...extraData }
  });
};

// Internal method for validation
export const getDeliveredQuantityForOrderItem = async (orderItemId) => {
  const items = await prisma.deliveryItem.findMany({
    where: { orderItemId, delivery: { status: { not: 'cancelled' } } }
  });
  return items.reduce((sum, item) => sum + item.quantity, 0);
};
