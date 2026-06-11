import React, { useState } from 'react';
import Table from '../../components/Table';
import { swalWarning } from '../../utils/swal';
import { Search, Plus, RefreshCcw } from 'lucide-react';
import { useData } from '../../context/GlobalDataContext';
import RequestModal from '../../components/RequestModal';
import Pagination from '../../components/Common/Pagination';
import { normalizeRole } from '../../utils/authUtils';
import { formatDateTimeEst } from '../../utils/dateEst';
import { usePurchaseRequests, useCreatePR, useUpdatePR, useDeletePR } from '../../hooks/api/useProcurement';

const PurchaseRequests = () => {
  const {
    purchaseRequests: mockRequests,
    addPurchaseRequest,
    updatePurchaseRequest,
    deletePurchaseRequest,
    fetchProcurement,
    hasMenuPermission,
    currentUser,
    fetchCustomerUsers,
    fetchStaff,
    fetchClients,
  } = useData();

  const [page, setPage] = useState(1);
  const [searchTerm, setSearchTerm] = useState('');
  
  const { data: prData, isLoading, error } = usePurchaseRequests(page, 10, searchTerm);
  
  const purchaseRequests = prData?.data?.length > 0 ? prData.data : (mockRequests || []);
  const meta = prData?.meta || { totalPages: 1, totalItems: purchaseRequests.length };
  
  const createPRMutation = useCreatePR();
  const updatePRMutation = useUpdatePR();
  const deletePRMutation = useDeletePR();

  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modalType, setModalType] = useState('view');
  const [selectedRequest, setSelectedRequest] = useState(null);

  const userRole = String(currentUser?.role?.name || currentUser?.role || '').toLowerCase().replace(/\s+/g, '_');
  const isCustomer = ['customer', 'saas_client', 'client'].includes(userRole);

  React.useEffect(() => {
    fetchProcurement();
    // Only fetch users/clients if the role has the required menu permissions
    if (hasMenuPermission('Personnel', 'can_view')) {
      fetchStaff();
      fetchCustomerUsers({ include_all: 1 });
    }
    if (hasMenuPermission('Clients', 'can_view')) {
      fetchClients();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);



  const handleAction = (type, req) => {
    setSelectedRequest(req);
    setModalType(type);
    setIsModalOpen(true);
  };

  const handleSave = async (formData) => {
    if (modalType === 'add') {
      try {
        await createPRMutation.mutateAsync(formData);
        console.log('[REAL_API_SUCCESS] Purchase Request Created');
      } catch (e) {
        console.warn('[REAL_API_FAILED] Create PR Failed. [FALLBACK_ACTIVATED]', e);
        addPurchaseRequest(formData);
      }
    } else if (modalType === 'edit') {
      try {
        await updatePRMutation.mutateAsync({ id: selectedRequest.id, data: formData });
        console.log('[REAL_API_SUCCESS] Purchase Request Updated');
      } catch (e) {
        console.warn('[REAL_API_FAILED] Update PR Failed. [FALLBACK_ACTIVATED]', e);
        updatePurchaseRequest({ ...selectedRequest, ...formData });
      }
    }
    setIsModalOpen(false);
  };

  const handleDelete = async (id) => {
    try {
      await deletePRMutation.mutateAsync(id);
      console.log('[REAL_API_SUCCESS] Purchase Request Deleted');
    } catch (e) {
      console.warn('[REAL_API_FAILED] Delete PR Failed. [FALLBACK_ACTIVATED]', e);
      deletePurchaseRequest(id);
    }
    setIsModalOpen(false);
  };

  const columns = [
    { header: "Request ID", accessor: "requestId" },
    {
      header: "Items",
      accessor: "items",
      render: (item) => {
        const items = Array.isArray(item.items) ? item.items : [];
        if (items.length === 0) return item.item || "No Items";
        if (items.length === 1) return items[0].name;
        return `${items[0].name} (+${items.length - 1} more)`;
      },
    },
    { header: "Requester", accessor: "requester" },
    {
      header: "Total Est.",
      accessor: "total",
      render: (item) => {
        const items = Array.isArray(item.items) ? item.items : [];
        const total = item.total || items.reduce((acc, i) => acc + ((parseFloat(i.price) || 0) * (parseFloat(i.qty) || 0)), 0);
        return `$${parseFloat(total || 0).toLocaleString()}`;
      },
    },
    { header: "Department", accessor: "department" },
    { header: "Status", accessor: "status" },
    {
      header: "Date / Time (EST)",
      accessor: "date",
      render: (item) => formatDateTimeEst(item.created_at || item.createdAt || item.date || item.requestDate),
    },
  ];

  const handleNewRequest = () => {
    const role = normalizeRole(currentUser?.role);
    const clientType = currentUser?.client_type || 'Individual';
    const isPremium = currentUser?.plan?.toLowerCase().includes('premium') || currentUser?.is_upgraded;

    if (role === 'customer' && clientType === 'Individual' && !isPremium) {
      swalWarning('Upgrade Required', 'Individuals need to upgrade to a Premium Plan ($10/mo) to submit purchase requests.');
      return;
    }

    handleAction('add', {});
  };

  return (
    <div className="space-y-8">
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h1 className="text-3xl font-bold tracking-tight text-white italic uppercase tracking-tighter">Purchase Requests</h1>
          <p className="text-secondary mt-1 text-sm font-medium opacity-80 italic uppercase tracking-widest">Review and approve procurement requests from departments.</p>
        </div>
        {(hasMenuPermission('Purchase Requests', 'can_add') || isCustomer) && (
          <button className="btn-primary flex items-center gap-2 px-6 py-3 rounded-xl shadow-lg shadow-accent/20" onClick={handleNewRequest}>
            <Plus size={16} /> New Request
          </button>
        )}
      </div>

      <div className="glass-card p-6">
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
          <div className="relative max-w-sm w-full">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-muted" size={18} />
            <input
              type="text"
              placeholder="Search by ID, Requester or Item..."
              value={searchTerm}
              onChange={(e) => {
                setSearchTerm(e.target.value);
                setPage(1);
              }}
              className="w-full bg-background border border-border rounded-lg py-2 pl-10 pr-4 text-sm focus:outline-none focus:border-accent"
            />
          </div>
        </div>

        {isLoading ? (
          <div className="flex justify-center p-12"><RefreshCcw className="animate-spin text-accent" /></div>
        ) : error ? (
          <div className="text-danger p-4">Failed to load purchase requests.</div>
        ) : (
          <>
            <Table
              columns={columns}
              data={purchaseRequests}
              actions={true}
              onView={(item) => handleAction('view', item)}
              onEdit={(item) => handleAction('edit', item)}
              onDelete={(item) => handleDelete(item.id)}
              canEdit={!isCustomer && hasMenuPermission('Purchase Requests', 'can_edit')}
              canDelete={!isCustomer && hasMenuPermission('Purchase Requests', 'can_delete')}
            />
            <div className="mt-6 border-t border-white/5 pt-6">
              <Pagination currentPage={page} totalPages={meta.totalPages} onPageChange={setPage} totalItems={meta.totalItems} />
            </div>
          </>
        )}
      </div>

      <RequestModal
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
        onSave={handleSave}
        selectedRequest={selectedRequest}
        modalType={modalType}
      />
    </div>
  );
};

export default PurchaseRequests;
