import { z } from 'zod';

const orderItemSchema = z.object({
  itemId: z.number().int().positive('Item ID is required'),
  warehouseId: z.number().int().positive('Warehouse ID is required for stock allocation'),
  quantity: z.number().positive('Quantity must be positive'),
  unitPrice: z.number().nonnegative('Unit Price must be non-negative')
});

export const createOrderSchema = z.object({
  clientId: z.number().int().positive('Client ID is required'),
  priority: z.enum(['normal', 'high', 'urgent']).optional().default('normal'),
  items: z.array(orderItemSchema).min(1, 'At least one item is required')
});

export const updateOrderStatusSchema = z.object({
  status: z.enum(['submitted', 'review', 'approved', 'rejected', 'cancelled'], { required_error: 'Valid status is required' })
});
