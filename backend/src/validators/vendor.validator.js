import { z } from 'zod';

export const createVendorSchema = z.object({
  vendorCode: z.string().min(2, 'Code must be at least 2 characters').max(20),
  companyName: z.string().min(2, 'Company name must be at least 2 characters').max(150),
  contactPerson: z.string().optional(),
  email: z.string().email('Invalid email address'),
  phone: z.string().optional(),
  address: z.string().optional(),
  status: z.enum(['active', 'inactive']).optional()
});

export const updateVendorSchema = z.object({
  vendorCode: z.string().min(2).max(20).optional(),
  companyName: z.string().min(2).max(150).optional(),
  contactPerson: z.string().optional(),
  email: z.string().email().optional(),
  phone: z.string().optional(),
  address: z.string().optional(),
  status: z.enum(['active', 'inactive']).optional()
});
