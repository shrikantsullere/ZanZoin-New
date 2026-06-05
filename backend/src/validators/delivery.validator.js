import { z } from 'zod';

const deliveryItemSchema = z.object({
  orderItemId: z.number().int().positive('Order Item ID is required'),
  itemId: z.number().int().positive('Item ID is required'),
  quantity: z.number().positive('Quantity must be positive')
});

export const createDeliverySchema = z.object({
  orderId: z.number().int().positive('Order ID is required'),
  warehouseId: z.number().int().positive('Warehouse ID is required'),
  remarks: z.string().optional(),
  items: z.array(deliveryItemSchema).min(1, 'At least one item is required to create a delivery')
});
