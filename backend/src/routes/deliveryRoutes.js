const express = require('express');
const router = express.Router();
const deliveryController = require('../controllers/deliveryController');
const { protect, authorize } = require('../middlewares/authMiddleware');

router.use(protect);

router
  .route('/')
  .get(deliveryController.getDeliveries)
  .post(authorize('SUPERADMIN', 'ADMIN', 'LOGISTICS'), deliveryController.createDelivery);

router
  .route('/:id')
  .get(deliveryController.getDeliveryById)
  .put(authorize('SUPERADMIN', 'ADMIN', 'LOGISTICS'), deliveryController.updateDelivery)
  .delete(authorize('SUPERADMIN', 'ADMIN'), deliveryController.deleteDelivery);

module.exports = router;
