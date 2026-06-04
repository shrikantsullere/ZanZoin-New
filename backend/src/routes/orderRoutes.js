const express = require('express');
const router = express.Router();
const orderController = require('../controllers/orderController');
const { protect, authorize } = require('../middlewares/authMiddleware');

router.use(protect);

router
  .route('/')
  .get(orderController.getOrders)
  .post(authorize('SUPERADMIN', 'ADMIN', 'CLIENT'), orderController.createOrder);

router
  .route('/:id')
  .get(orderController.getOrderById)
  .put(authorize('SUPERADMIN', 'ADMIN', 'OPERATIONS'), orderController.updateOrder)
  .delete(authorize('SUPERADMIN', 'ADMIN'), orderController.deleteOrder);

module.exports = router;
