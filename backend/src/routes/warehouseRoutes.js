const express = require('express');
const router = express.Router();
const warehouseController = require('../controllers/warehouseController');
const { protect, authorize } = require('../middlewares/authMiddleware');

router.use(protect);

router
  .route('/')
  .get(warehouseController.getWarehouses)
  .post(authorize('SUPERADMIN', 'ADMIN'), warehouseController.createWarehouse);

router
  .route('/:id')
  .get(warehouseController.getWarehouseById)
  .put(authorize('SUPERADMIN', 'ADMIN'), warehouseController.updateWarehouse)
  .delete(authorize('SUPERADMIN', 'ADMIN'), warehouseController.deleteWarehouse);

module.exports = router;
