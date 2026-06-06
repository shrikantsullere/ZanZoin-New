import prisma from '../config/db.js';

const generateOrderNumber = async (tenantId) => {
  const count = await prisma.order.count({ where: { tenantId } });
  return `ORD-${new Date().getFullYear()}-${String(count + 1).padStart(4, '0')}`;
};

export const createOrder = async (data, items, tenantId) => {
  return await prisma.$transaction(async (tx) => {
    const orderNumber = await generateOrderNumber(tenantId);
    
    const itemsArray = items || [];
    const totalAmount = itemsArray.reduce((sum, item) => sum + (item.quantity * item.unitPrice), 0);

    return await tx.order.create({
      data: {
        ...data,
        orderNumber,
        tenantId,
        totalAmount,
        ...(itemsArray.length > 0 && {
          items: {
            create: itemsArray.map(item => ({
              ...item,
              tenantId,
              totalPrice: item.quantity * item.unitPrice
            }))
          }
        })
      },
      include: { items: true, client: true }
    });
  });
};

export const findOrderById = async (id) => {
  return await prisma.order.findUnique({
    where: { id },
    include: {
      items: { include: { item: true } },
      client: true,
      creator: { select: { firstName: true, lastName: true } }
    }
  });
};

export const findAllOrders = async (tenantId, query) => {
  const { page = 1, limit = 10, search = '', status, clientId } = query;
  const skip = (page - 1) * limit;

  const where = {
    ...(tenantId !== null && { tenantId }),
    ...(search && { orderNumber: { contains: search } }),
    ...(status && { status }),
    ...(clientId && { clientId: Number(clientId) })
  };

  const [orders, total] = await Promise.all([
    prisma.order.findMany({
      where,
      skip: Number(skip),
      take: Number(limit),
      orderBy: { createdAt: 'desc' },
      include: {
        client: { select: { companyName: true, clientCode: true } }
      }
    }),
    prisma.order.count({ where })
  ]);

  return { orders, total, page: Number(page), totalPages: Math.ceil(total / limit) };
};

export const updateOrderStatus = async (id, status) => {
  return await prisma.order.update({
    where: { id },
    data: { status }
  });
};

export const deleteOrder = async (id) => {
  return await prisma.order.delete({ where: { id } });
};
