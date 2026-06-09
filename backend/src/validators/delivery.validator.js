import { z } from 'zod';

const deliveryItemSchema = z.object({
  orderItemId: z.number().int().positive('Order Item ID is required').optional().nullable(),
  itemId: z.number().int().positive('Item ID is required').optional().nullable(),
  quantity: z.number().positive('Quantity must be positive')
});

export const createDeliverySchema = z.object({
  orderId: z.number().int().positive('Order ID is required').optional().nullable(),
  warehouseId: z.number().int().positive('Warehouse ID is required').optional().nullable(),
  clientId: z.number().int().positive('Client ID is required').optional().nullable(),
  remarks: z.string().optional(),
  items: z.array(deliveryItemSchema).optional(),
  missionType: z.string().optional(),
  transportMode: z.string().optional(),
  vehicleRef: z.string().optional(),
  etaSchedule: z.string().optional(),
  requestDate: z.string().optional(),
  dueDate: z.string().optional(),
  pickupLocation: z.string().optional(),
  dropLocation: z.string().optional(),
  routeDistance: z.number().optional(),
  staffPayRate: z.number().optional(),
  deliveryFee: z.number().optional(),
});
