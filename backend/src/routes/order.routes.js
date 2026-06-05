import express from 'express';
import * as orderController from '../controllers/order.controller.js';
import { validate } from '../middlewares/validate.middleware.js';
import { createOrderSchema, updateOrderStatusSchema } from '../validators/order.validator.js';
import { authenticate, checkPermission } from '../middlewares/auth.middleware.js';

const router = express.Router();

router.use(authenticate);

router.get('/', checkPermission('ORDERS', 'READ'), orderController.getOrders);
router.get('/:id', checkPermission('ORDERS', 'READ'), orderController.getOrderById);
router.post('/', checkPermission('ORDERS', 'CREATE'), validate(createOrderSchema), orderController.createOrder);
router.put('/:id/status', checkPermission('ORDERS', 'APPROVE'), validate(updateOrderStatusSchema), orderController.updateOrderStatus);
router.delete('/:id', checkPermission('ORDERS', 'DELETE'), orderController.deleteOrder);

export default router;
