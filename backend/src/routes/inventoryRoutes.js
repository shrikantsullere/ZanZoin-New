const express = require('express');
const router = express.Router();
const inventoryController = require('../controllers/inventoryController');
const { protect, authorize } = require('../middlewares/authMiddleware');

router.use(protect);

router
  .route('/')
  .get(inventoryController.getInventory)
  .post(authorize('SUPERADMIN', 'ADMIN', 'INVENTORY'), inventoryController.createInventoryItem);

router
  .route('/:id')
  .get(inventoryController.getInventoryById)
  .put(authorize('SUPERADMIN', 'ADMIN', 'INVENTORY'), inventoryController.updateInventory)
  .delete(authorize('SUPERADMIN', 'ADMIN'), inventoryController.deleteInventoryItem);

module.exports = router;
