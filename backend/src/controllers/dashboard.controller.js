import { PrismaClient } from '@prisma/client';
import { sendResponse } from '../utils/response.js';

const prisma = new PrismaClient();

export const getDashboardStats = async (req, res, next) => {
  try {
    const tenantId = req.user?.tenantId;
    const filter = tenantId ? { tenantId } : {};

    const [
      activeClients,
      pendingOrders,
      completedOrders,
      deliveriesToday,
      invoices
    ] = await Promise.all([
      prisma.client.count({ where: { ...filter, status: 'active' } }),
      prisma.order.count({ where: { ...filter, status: { not: 'delivered' } } }),
      prisma.order.count({ where: { ...filter, status: 'delivered' } }),
      prisma.delivery.count({ where: { ...filter } }), // Or filter by date if needed
      prisma.invoice.findMany({ where: filter, select: { totalAmount: true, status: true } })
    ]);

    const totalRevenue = invoices.reduce((sum, inv) => sum + (inv.totalAmount || 0), 0);
    const outstandingRevenue = invoices
      .filter(inv => inv.status !== 'paid' && inv.status !== 'Paid')
      .reduce((sum, inv) => sum + (inv.totalAmount || 0), 0);

    sendResponse(res, 200, 'Dashboard stats retrieved successfully', {
      activeClients,
      pendingOrders,
      deliveriesToday,
      activeEvents: 0, // Mocked for now
      totalRevenue,
      relevantRevenue: totalRevenue,
      outstandingRevenue,
      completedOrders
    });
  } catch (error) {
    next(error);
  }
};
