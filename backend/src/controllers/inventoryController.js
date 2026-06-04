const prisma = require('../utils/prisma');

// @desc    Create new inventory item
// @route   POST /api/v1/inventory
// @access  Private (Admin/SuperAdmin/Inventory)
exports.createInventoryItem = async (req, res) => {
  try {
    const { name, quantity, location, status, warehouse_id } = req.body;
    
    const item = await prisma.inventory.create({
      data: { name, quantity, location, status, warehouse_id }
    });

    res.status(201).json({ success: true, data: item });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get all inventory
// @route   GET /api/v1/inventory
// @access  Private
exports.getInventory = async (req, res) => {
  try {
    const inventory = await prisma.inventory.findMany({
      include: { warehouse: true }
    });
    res.status(200).json({ success: true, data: inventory });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Update inventory quantity/status
// @route   PUT /api/v1/inventory/:id
// @access  Private
exports.updateInventory = async (req, res) => {
  try {
    const { quantity, status, location } = req.body;

    const item = await prisma.inventory.update({
      where: { id: parseInt(req.params.id) },
      data: { quantity, status, location }
    });

    res.status(200).json({ success: true, data: item });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Item not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get single inventory item
// @route   GET /api/v1/inventory/:id
// @access  Private
exports.getInventoryById = async (req, res) => {
  try {
    const item = await prisma.inventory.findUnique({
      where: { id: parseInt(req.params.id) },
      include: { warehouse: true }
    });
    if (!item) {
      return res.status(404).json({ success: false, message: 'Item not found' });
    }
    res.status(200).json({ success: true, data: item });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Delete inventory item
// @route   DELETE /api/v1/inventory/:id
// @access  Private
exports.deleteInventoryItem = async (req, res) => {
  try {
    await prisma.inventory.delete({
      where: { id: parseInt(req.params.id) }
    });
    res.status(200).json({ success: true, message: 'Item deleted successfully' });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Item not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};
