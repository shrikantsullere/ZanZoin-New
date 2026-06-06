import { z } from 'zod';

const orderItemSchema = z.object({
  itemId: z.number().int().positive('Item ID is required').optional(),
  warehouseId: z.number().int().positive('Warehouse ID is required for stock allocation').optional(),
  quantity: z.union([z.number(), z.string()]).optional(),
  unitPrice: z.union([z.number(), z.string()]).optional(),
  name: z.string().optional(),
  qty: z.union([z.number(), z.string()]).optional(),
  price: z.union([z.number(), z.string()]).optional(),
}).passthrough();

export const createOrderSchema = z.object({
  clientId: z.number().int().positive('Client ID is required'),
  priority: z.enum(['normal', 'high', 'urgent']).optional().default('normal'),
  items: z.array(z.any()).optional()
}).passthrough();

export const updateOrderStatusSchema = z.object({
  status: z.enum(['submitted', 'review', 'approved', 'rejected', 'cancelled'], { required_error: 'Valid status is required' })
});
