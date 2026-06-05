import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';

// Simulated API for Chauffeur since backend ERP does not have a Chauffeur module natively.
// This fulfills the requirement to use the React Query pattern without modifying the Sprint 1-3 backend schema.

const getStoredChauffeurRequests = () => {
  const data = localStorage.getItem('chauffeur_mock_db');
  return data ? JSON.parse(data) : [];
};

const saveChauffeurRequests = (data) => {
  localStorage.setItem('chauffeur_mock_db', JSON.stringify(data));
};

export const useChauffeurMissions = (page = 1, limit = 10, search = '') => {
  return useQuery({
    queryKey: ['chauffeurMissions', page, limit, search],
    queryFn: async () => {
      // Simulate network delay
      await new Promise(resolve => setTimeout(resolve, 300));
      let data = getStoredChauffeurRequests();
      
      if (search) {
        data = data.filter(req => 
          req.id?.toLowerCase().includes(search.toLowerCase()) || 
          req.clientName?.toLowerCase().includes(search.toLowerCase()) || 
          req.pickupLocation?.toLowerCase().includes(search.toLowerCase())
        );
      }

      // Pagination
      const startIndex = (page - 1) * limit;
      const paginatedData = data.slice(startIndex, startIndex + limit);

      return {
        success: true,
        data: paginatedData,
        meta: {
          totalItems: data.length,
          totalPages: Math.ceil(data.length / limit),
          currentPage: page,
          itemsPerPage: limit
        }
      };
    }
  });
};

export const useCreateChauffeurMission = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (missionData) => {
      await new Promise(resolve => setTimeout(resolve, 300));
      const data = getStoredChauffeurRequests();
      const newMission = {
        id: `CHF-${Date.now()}`,
        ...missionData,
        createdAt: new Date().toISOString()
      };
      saveChauffeurRequests([newMission, ...data]);
      return { success: true, data: newMission };
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['chauffeurMissions'] });
    }
  });
};

export const useUpdateChauffeurMission = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async ({ id, data }) => {
      await new Promise(resolve => setTimeout(resolve, 300));
      const requests = getStoredChauffeurRequests();
      const index = requests.findIndex(r => r.id === id);
      if (index !== -1) {
        requests[index] = { ...requests[index], ...data, updatedAt: new Date().toISOString() };
        saveChauffeurRequests(requests);
        return { success: true, data: requests[index] };
      }
      throw new Error("Mission not found");
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['chauffeurMissions'] });
    }
  });
};

export const useDeleteChauffeurMission = () => {
    const queryClient = useQueryClient();
    return useMutation({
      mutationFn: async (id) => {
        await new Promise(resolve => setTimeout(resolve, 300));
        let requests = getStoredChauffeurRequests();
        requests = requests.filter(r => r.id !== id);
        saveChauffeurRequests(requests);
        return { success: true };
      },
      onSuccess: () => {
        queryClient.invalidateQueries({ queryKey: ['chauffeurMissions'] });
      }
    });
};
