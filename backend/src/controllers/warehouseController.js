const prisma = require('../utils/prisma');

// @desc    Create new warehouse
// @route   POST /api/v1/warehouses
// @access  Private (Admin/SuperAdmin)
exports.createWarehouse = async (req, res) => {
  try {
    const { name, location } = req.body;
    
    const warehouse = await prisma.warehouse.create({
      data: { name, location }
    });

    res.status(201).json({ success: true, data: warehouse });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get all warehouses
// @route   GET /api/v1/warehouses
// @access  Private
exports.getWarehouses = async (req, res) => {
  try {
    const warehouses = await prisma.warehouse.findMany({
      include: {
        _count: { select: { inventory: true } }
      }
    });
    res.status(200).json({ success: true, data: warehouses });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get single warehouse
// @route   GET /api/v1/warehouses/:id
// @access  Private
exports.getWarehouseById = async (req, res) => {
  try {
    const warehouse = await prisma.warehouse.findUnique({
      where: { id: parseInt(req.params.id) },
      include: {
        inventory: true
      }
    });
    if (!warehouse) {
      return res.status(404).json({ success: false, message: 'Warehouse not found' });
    }
    res.status(200).json({ success: true, data: warehouse });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Update warehouse
// @route   PUT /api/v1/warehouses/:id
// @access  Private
exports.updateWarehouse = async (req, res) => {
  try {
    const { name, location } = req.body;
    const warehouse = await prisma.warehouse.update({
      where: { id: parseInt(req.params.id) },
      data: { name, location }
    });
    res.status(200).json({ success: true, data: warehouse });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Warehouse not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Delete warehouse
// @route   DELETE /api/v1/warehouses/:id
// @access  Private
exports.deleteWarehouse = async (req, res) => {
  try {
    await prisma.warehouse.delete({
      where: { id: parseInt(req.params.id) }
    });
    res.status(200).json({ success: true, message: 'Warehouse deleted successfully' });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Warehouse not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};
