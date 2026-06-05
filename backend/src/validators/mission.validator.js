import { z } from 'zod';

export const createMissionSchema = z.object({
  deliveryId: z.number().int().positive('Delivery ID is required'),
  assignedEmployeeId: z.number().int().positive('Assigned Employee ID is required'),
  remarks: z.string().optional()
});

export const submitPODSchema = z.object({
  receiverName: z.string().min(2, 'Receiver Name is required'),
  receiverPhone: z.string().optional(),
  receiverSignature: z.string().optional(),
  deliveryPhoto: z.string().optional(),
  remarks: z.string().optional()
});
