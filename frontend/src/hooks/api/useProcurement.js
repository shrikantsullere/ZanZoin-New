import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import api from '../../services/api/setupAxios';

// Purchase Requests (PR)
export const usePurchaseRequests = (page = 1, limit = 10, search = '') => {
  return useQuery({
    queryKey: ['purchaseRequests', page, limit, search],
    queryFn: async () => {
      const res = await api.get('/purchase-requests', { params: { page, limit, search } });
      return res.data?.data || [];
    }
  });
};

export const useCreatePR = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (data) => {
      const res = await api.post('/purchase-requests', data);
      return res.data;
    },
    onSuccess: () => queryClient.invalidateQueries(['purchaseRequests'])
  });
};

// Request For Quotation (RFQ)
export const useRFQs = (page = 1, limit = 10) => {
  return useQuery({
    queryKey: ['rfqs', page, limit],
    queryFn: async () => {
      const res = await api.get('/rfqs', { params: { page, limit } });
      return res.data?.data || [];
    }
  });
};

// Quotes
export const useQuotes = (page = 1, limit = 10) => {
  return useQuery({
    queryKey: ['quotes', page, limit],
    queryFn: async () => {
      const res = await api.get('/quotes', { params: { page, limit } });
      return res.data?.data || [];
    }
  });
};

// Purchase Orders (PO)
export const usePurchaseOrders = (page = 1, limit = 10, search = '') => {
  return useQuery({
    queryKey: ['purchaseOrders', page, limit, search],
    queryFn: async () => {
      const res = await api.get('/purchase-orders', { params: { page, limit, search } });
      return res.data?.data || [];
    }
  });
};
