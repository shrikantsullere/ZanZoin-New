const prisma = require('../utils/prisma');

// @desc    Get dashboard stats
// @route   GET /api/v1/dashboard/stats
// @access  Private
exports.getStats = async (req, res) => {
  try {
    const totalClients = await prisma.client.count();
    const totalOrders = await prisma.order.count();
    const totalDeliveries = await prisma.delivery.count();
    const totalInvoices = await prisma.invoice.count();
    const activeVendors = await prisma.vendor.count({ where: { status: 'ACTIVE' } });
    
    // Revenue sum (only PAID invoices)
    const revenueResult = await prisma.invoice.aggregate({
      _sum: { amount: true },
      where: { status: 'PAID' }
    });

    const pendingOrders = await prisma.order.count({ where: { status: 'PENDING' } });

    res.status(200).json({
      success: true,
      data: {
        totalClients,
        totalOrders,
        totalDeliveries,
        totalInvoices,
        activeVendors,
        totalRevenue: revenueResult._sum.amount || 0,
        pendingOrders
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};
