import { z } from 'zod';

export const createQuotationSchema = z.object({
  rfqId: z.number().int().positive('RFQ ID is required'),
  vendorId: z.number().int().positive('Vendor ID is required'),
  amount: z.number().positive('Amount must be positive'),
  remarks: z.string().optional()
});

export const updateQuotationStatusSchema = z.object({
  status: z.enum(['approved', 'rejected'], { required_error: 'Valid status is required' })
});
