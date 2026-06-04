const prisma = require('../utils/prisma');

// @desc    Create new order
// @route   POST /api/v1/orders
// @access  Private
exports.createOrder = async (req, res) => {
  try {
    const { client_id, product, status, delivery_time } = req.body;
    
    const order = await prisma.order.create({
      data: {
        client_id,
        product,
        status: status || 'PENDING',
        delivery_time: delivery_time ? new Date(delivery_time) : null
      }
    });

    res.status(201).json({ success: true, data: order });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get all orders
// @route   GET /api/v1/orders
// @access  Private
exports.getOrders = async (req, res) => {
  try {
    const orders = await prisma.order.findMany({
      include: { 
        client: true,
        deliveries: true,
        invoices: true
      }
    });
    res.status(200).json({ success: true, data: orders });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Update order status
// @route   PUT /api/v1/orders/:id
// @access  Private
exports.updateOrder = async (req, res) => {
  try {
    const { status, delivery_time } = req.body;

    const dataToUpdate = { status };
    if (delivery_time) dataToUpdate.delivery_time = new Date(delivery_time);

    const order = await prisma.order.update({
      where: { id: parseInt(req.params.id) },
      data: dataToUpdate
    });

    res.status(200).json({ success: true, data: order });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Order not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get single order
// @route   GET /api/v1/orders/:id
// @access  Private
exports.getOrderById = async (req, res) => {
  try {
    const order = await prisma.order.findUnique({
      where: { id: parseInt(req.params.id) },
      include: { 
        client: true,
        deliveries: true,
        invoices: true
      }
    });
    if (!order) {
      return res.status(404).json({ success: false, message: 'Order not found' });
    }
    res.status(200).json({ success: true, data: order });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Delete order
// @route   DELETE /api/v1/orders/:id
// @access  Private
exports.deleteOrder = async (req, res) => {
  try {
    await prisma.order.delete({
      where: { id: parseInt(req.params.id) }
    });
    res.status(200).json({ success: true, message: 'Order deleted successfully' });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Order not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};
