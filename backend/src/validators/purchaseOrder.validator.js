import { z } from 'zod';

export const createPurchaseOrderSchema = z.object({
  vendorId: z.number().int().positive('Vendor ID is required'),
  purchaseRequestId: z.number().int().positive('Purchase Request ID is required'),
  quotationId: z.number().int().positive('Quotation ID is required').optional(),
  totalAmount: z.number().positive('Total Amount must be positive')
});

export const updatePurchaseOrderStatusSchema = z.object({
  status: z.enum(['approved', 'rejected', 'cancelled', 'waiting_for_delivery'], { required_error: 'Valid status is required' })
});
