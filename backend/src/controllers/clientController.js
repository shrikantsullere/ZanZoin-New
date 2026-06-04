const prisma = require('../utils/prisma');

// @desc    Create new client
// @route   POST /api/v1/clients
// @access  Private (Admin/SuperAdmin)
exports.createClient = async (req, res) => {
  try {
    const { name, location, client_type } = req.body;
    
    const client = await prisma.client.create({
      data: {
        name,
        location,
        client_type: client_type || 'BUSINESS'
      }
    });

    res.status(201).json({ success: true, data: client });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get all clients
// @route   GET /api/v1/clients
// @access  Private
exports.getClients = async (req, res) => {
  try {
    const clients = await prisma.client.findMany({
      include: {
        _count: {
          select: { orders: true, users: true }
        }
      }
    });
    res.status(200).json({ success: true, data: clients });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get single client
// @route   GET /api/v1/clients/:id
// @access  Private
exports.getClientById = async (req, res) => {
  try {
    const client = await prisma.client.findUnique({
      where: { id: parseInt(req.params.id) },
      include: {
        users: { select: { id: true, name: true, email: true, role: true } },
        orders: true,
        invoices: true
      }
    });

    if (!client) {
      return res.status(404).json({ success: false, message: 'Client not found' });
    }

    res.status(200).json({ success: true, data: client });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Update client
// @route   PUT /api/v1/clients/:id
// @access  Private
exports.updateClient = async (req, res) => {
  try {
    const { name, location, status, client_type } = req.body;

    const client = await prisma.client.update({
      where: { id: parseInt(req.params.id) },
      data: { name, location, status, client_type }
    });

    res.status(200).json({ success: true, data: client });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Client not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Delete client
// @route   DELETE /api/v1/clients/:id
// @access  Private
exports.deleteClient = async (req, res) => {
  try {
    await prisma.client.delete({
      where: { id: parseInt(req.params.id) }
    });

    res.status(200).json({ success: true, message: 'Client deleted successfully' });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Client not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};
