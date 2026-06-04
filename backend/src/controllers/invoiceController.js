const prisma = require('../utils/prisma');

// @desc    Create new invoice
// @route   POST /api/v1/invoices
// @access  Private (Admin/SuperAdmin)
exports.createInvoice = async (req, res) => {
  try {
    const { order_id, client_id, amount, status, due_date } = req.body;
    
    const invoice = await prisma.invoice.create({
      data: {
        order_id,
        client_id,
        amount,
        status: status || 'UNPAID',
        due_date: due_date ? new Date(due_date) : null
      }
    });

    res.status(201).json({ success: true, data: invoice });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get all invoices
// @route   GET /api/v1/invoices
// @access  Private
exports.getInvoices = async (req, res) => {
  try {
    const invoices = await prisma.invoice.findMany({
      include: { client: { select: { id: true, name: true } } }
    });
    res.status(200).json({ success: true, data: invoices });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Get single invoice
// @route   GET /api/v1/invoices/:id
// @access  Private
exports.getInvoiceById = async (req, res) => {
  try {
    const invoice = await prisma.invoice.findUnique({
      where: { id: parseInt(req.params.id) },
      include: { 
        client: { select: { id: true, name: true, location: true } },
        order: { select: { id: true, product: true } }
      }
    });
    if (!invoice) {
      return res.status(404).json({ success: false, message: 'Invoice not found' });
    }
    res.status(200).json({ success: true, data: invoice });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Update invoice
// @route   PUT /api/v1/invoices/:id
// @access  Private
exports.updateInvoice = async (req, res) => {
  try {
    const { status, amount, due_date } = req.body;
    
    const dataToUpdate = { status, amount };
    if (due_date) dataToUpdate.due_date = new Date(due_date);

    const invoice = await prisma.invoice.update({
      where: { id: parseInt(req.params.id) },
      data: dataToUpdate
    });
    res.status(200).json({ success: true, data: invoice });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Invoice not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// @desc    Delete invoice
// @route   DELETE /api/v1/invoices/:id
// @access  Private
exports.deleteInvoice = async (req, res) => {
  try {
    await prisma.invoice.delete({
      where: { id: parseInt(req.params.id) }
    });
    res.status(200).json({ success: true, message: 'Invoice deleted successfully' });
  } catch (error) {
    console.error(error);
    if (error.code === 'P2025') {
      return res.status(404).json({ success: false, message: 'Invoice not found' });
    }
    res.status(500).json({ success: false, message: 'Server error' });
  }
};
