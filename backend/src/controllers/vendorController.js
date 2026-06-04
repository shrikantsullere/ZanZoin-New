const prisma = require('../utils/prisma');

// @desc    Create new vendor
// @route   POST /api/v1/vendors
// @access  Private (Admin/Procurement)
exports.createVendor = async (req, res) => {
  try {
    const { name, rating, delivery_score, status } = req.body;
    
    const vendor = await prisma.vendor.create({
      data: { name, rating, delivery_score, status }
    });

    res.status(201).json({ success: true, data: vendor });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get all vendors
// @route   GET /api/v1/vendors
// @access  Private
exports.getVendors = async (req, res) => {
  try {
    const vendors = await prisma.vendor.findMany();
    res.status(200).json({ success: true, data: vendors });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get single vendor
// @route   GET /api/v1/vendors/:id
// @access  Private
exports.getVendorById = async (req, res) => {
  try {
    const vendor = await prisma.vendor.findUnique({
      where: { id: parseInt(req.params.id) }
    });
    if (!vendor) {
      return res.status(404).json({ success: false, message: 'Vendor not found' });
    }
    res.status(200).json({ success: true, data: vendor });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Update vendor
// @route   PUT /api/v1/vendors/:id
// @access  Private
exports.updateVendor = async (req, res) => {
  try {
    const { name, rating, delivery_score, status } = req.body;
    const vendor = await prisma.vendor.update({
      where: { id: parseInt(req.params.id) },
      data: { name, rating, delivery_score, status }
    });
    res.status(200).json({ success: true, data: vendor });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Vendor not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Delete vendor
// @route   DELETE /api/v1/vendors/:id
// @access  Private
exports.deleteVendor = async (req, res) => {
  try {
    await prisma.vendor.delete({
      where: { id: parseInt(req.params.id) }
    });
    res.status(200).json({ success: true, message: 'Vendor deleted successfully' });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Vendor not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};
