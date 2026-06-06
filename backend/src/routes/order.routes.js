import express from 'express';
import * as orderController from '../controllers/order.controller.js';
import { validate } from '../middlewares/validate.middleware.js';
import { createOrderSchema, updateOrderStatusSchema } from '../validators/order.validator.js';
import { authenticate, checkPermission } from '../middlewares/auth.middleware.js';

const router = express.Router();

router.use(authenticate);

router.get('/', checkPermission('ORDERS', 'READ'), orderController.getOrders);
router.get('/projects/all', checkPermission('ORDERS', 'READ'), orderController.getProjects);
router.post('/projects', checkPermission('ORDERS', 'CREATE'), orderController.createProject);
router.put('/projects/:id', checkPermission('ORDERS', 'UPDATE'), orderController.updateProject);
router.delete('/projects/:id', checkPermission('ORDERS', 'DELETE'), orderController.deleteProject);
router.get('/:id', checkPermission('ORDERS', 'READ'), orderController.getOrderById);
router.post('/', checkPermission('ORDERS', 'CREATE'), validate(createOrderSchema), orderController.createOrder);
router.put('/:id', checkPermission('ORDERS', 'UPDATE'), orderController.updateOrder);
router.put('/:id/status', checkPermission('ORDERS', 'APPROVE'), validate(updateOrderStatusSchema), orderController.updateOrderStatus);
router.delete('/:id', checkPermission('ORDERS', 'DELETE'), orderController.deleteOrder);

export default router;
