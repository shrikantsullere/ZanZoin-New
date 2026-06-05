import express from 'express';
import * as poController from '../controllers/purchaseOrder.controller.js';
import { validate } from '../middlewares/validate.middleware.js';
import { createPurchaseOrderSchema, updatePurchaseOrderStatusSchema } from '../validators/purchaseOrder.validator.js';
import { authenticate, checkPermission } from '../middlewares/auth.middleware.js';

const router = express.Router();

router.use(authenticate);

router.get('/', checkPermission('PURCHASE_ORDERS', 'READ'), poController.getPurchaseOrders);
router.get('/:id', checkPermission('PURCHASE_ORDERS', 'READ'), poController.getPurchaseOrderById);
router.post('/', checkPermission('PURCHASE_ORDERS', 'CREATE'), validate(createPurchaseOrderSchema), poController.createPurchaseOrder);
router.put('/:id/status', checkPermission('PURCHASE_ORDERS', 'APPROVE'), validate(updatePurchaseOrderStatusSchema), poController.updatePurchaseOrderStatus);
router.delete('/:id', checkPermission('PURCHASE_ORDERS', 'DELETE'), poController.deletePurchaseOrder);

export default router;
