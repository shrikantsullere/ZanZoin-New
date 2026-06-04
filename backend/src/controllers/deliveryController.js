const prisma = require('../utils/prisma');

// @desc    Create new delivery (Logistics)
// @route   POST /api/v1/deliveries
// @access  Private (Admin/Logistics)
exports.createDelivery = async (req, res) => {
  try {
    const { order_id, driver_id, vehicle_id, route, eta } = req.body;
    
    const delivery = await prisma.delivery.create({
      data: { order_id, driver_id, vehicle_id, route, eta }
    });

    res.status(201).json({ success: true, data: delivery });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get all deliveries
// @route   GET /api/v1/deliveries
// @access  Private
exports.getDeliveries = async (req, res) => {
  try {
    const deliveries = await prisma.delivery.findMany({
      include: { 
        driver: { select: { id: true, name: true } },
        order: { select: { id: true, product: true, client: { select: { name: true } } } }
      }
    });
    res.status(200).json({ success: true, data: deliveries });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Update delivery status
// @route   PUT /api/v1/deliveries/:id
// @access  Private
exports.updateDelivery = async (req, res) => {
  try {
    const { status, eta, route } = req.body;

    const delivery = await prisma.delivery.update({
      where: { id: parseInt(req.params.id) },
      data: { status, eta, route }
    });

    res.status(200).json({ success: true, data: delivery });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Delivery not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get single delivery
// @route   GET /api/v1/deliveries/:id
// @access  Private
exports.getDeliveryById = async (req, res) => {
  try {
    const delivery = await prisma.delivery.findUnique({
      where: { id: parseInt(req.params.id) },
      include: { 
        driver: { select: { id: true, name: true } },
        order: { select: { id: true, product: true, client: { select: { name: true, location: true } } } }
      }
    });
    if (!delivery) {
      return res.status(404).json({ success: false, message: 'Delivery not found' });
    }
    res.status(200).json({ success: true, data: delivery });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Delete delivery
// @route   DELETE /api/v1/deliveries/:id
// @access  Private
exports.deleteDelivery = async (req, res) => {
  try {
    await prisma.delivery.delete({
      where: { id: parseInt(req.params.id) }
    });
    res.status(200).json({ success: true, message: 'Delivery deleted successfully' });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Delivery not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};
