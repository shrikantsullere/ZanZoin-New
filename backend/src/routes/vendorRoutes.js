const express = require('express');
const router = express.Router();
const vendorController = require('../controllers/vendorController');
const { protect, authorize } = require('../middlewares/authMiddleware');

router.use(protect);

router
  .route('/')
  .get(vendorController.getVendors)
  .post(authorize('SUPERADMIN', 'ADMIN', 'PROCUREMENT'), vendorController.createVendor);

router
  .route('/:id')
  .get(vendorController.getVendorById)
  .put(authorize('SUPERADMIN', 'ADMIN', 'PROCUREMENT'), vendorController.updateVendor)
  .delete(authorize('SUPERADMIN', 'ADMIN'), vendorController.deleteVendor);

module.exports = router;
