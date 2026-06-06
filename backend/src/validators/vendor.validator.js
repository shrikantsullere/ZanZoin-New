import { z } from 'zod';

export const createVendorSchema = z.object({
  vendorCode: z.string().min(2).max(20).optional(),
  companyName: z.string().min(2).max(150).optional(),
  name: z.string().optional(),
  contactPerson: z.string().optional(),
  contact: z.string().optional(),
  email: z.string().email('Invalid email address'),
  phone: z.string().optional(),
  address: z.string().optional(),
  status: z.enum(['active', 'inactive']).optional()
});

export const updateVendorSchema = z.object({
  vendorCode: z.string().min(2).max(20).optional(),
  companyName: z.string().min(2).max(150).optional(),
  name: z.string().optional(),
  contactPerson: z.string().optional(),
  contact: z.string().optional(),
  email: z.string().email().optional(),
  phone: z.string().optional(),
  address: z.string().optional(),
  status: z.enum(['active', 'inactive']).optional()
});
