const express = require('express');
const router = express.Router();
const invoiceController = require('../controllers/invoiceController');
const { protect, authorize } = require('../middlewares/authMiddleware');

router.use(protect);

router
  .route('/')
  .get(invoiceController.getInvoices)
  .post(authorize('SUPERADMIN', 'ADMIN'), invoiceController.createInvoice);

router
  .route('/:id')
  .get(invoiceController.getInvoiceById)
  .put(authorize('SUPERADMIN', 'ADMIN'), invoiceController.updateInvoice)
  .delete(authorize('SUPERADMIN', 'ADMIN'), invoiceController.deleteInvoice);

module.exports = router;
