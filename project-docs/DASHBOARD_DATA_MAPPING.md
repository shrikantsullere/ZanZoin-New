# DASHBOARD DATA MAPPING

This document maps every metric card on the dashboard to its real database table and the corresponding backend aggregation logic. React-side array filtering will be completely replaced by this backend endpoint.

## 1. Open Orders
- **Current Mock Source:** React-side array filtering `(orders || []).filter(...)`
- **Database Table:** `Order` (`orders`)
- **Backend Endpoint:** `GET /api/v1/dashboard/stats`
- **Role Visibility:** Admin, Operations, Concierge, Logistics
- **Tenant Scope:** Scoped via `req.user.tenantId`
- **Calculation Logic:** `prisma.order.count({ where: { status: { notIn: ['completed', 'cancelled'] } } })`

## 2. Completed Orders
- **Current Mock Source:** React-side array filtering
- **Database Table:** `Order`
- **Backend Endpoint:** `GET /api/v1/dashboard/stats`
- **Role Visibility:** Admin, Operations
- **Tenant Scope:** Scoped
- **Calculation Logic:** `prisma.order.count({ where: { status: 'completed' } })`

## 3. Revenue & Unpaid Invoices
- **Current Mock Source:** React-side reduce `(invoices || []).reduce(...)`
- **Database Table:** `Invoice`
- **Backend Endpoint:** `GET /api/v1/dashboard/stats`
- **Role Visibility:** Super Admin, Admin
- **Tenant Scope:** Scoped
- **Calculation Logic:** Aggregated sum of `totalAmount` where `status === 'Paid'` (Revenue) and `status !== 'Paid'` (Unpaid).

## 4. Active Staff
- **Current Mock Source:** React-side array filtering `users.filter(u => u.status === 'Active')`
- **Database Table:** `User`
- **Backend Endpoint:** `GET /api/v1/dashboard/stats`
- **Role Visibility:** Admin, Operations
- **Tenant Scope:** Scoped
- **Calculation Logic:** `prisma.user.count({ where: { status: 'active' } })`

## 5. Active Clients
- **Current Mock Source:** React-side array filtering
- **Database Table:** `Client`
- **Backend Endpoint:** `GET /api/v1/dashboard/stats`
- **Role Visibility:** Admin, Super Admin
- **Tenant Scope:** Scoped
- **Calculation Logic:** `prisma.client.count({ where: { status: 'active' } })`

## 6. Fleet Available
- **Current Mock Source:** React-side array filtering
- **Database Table:** `Vehicle` or `User` (using `vehicleType` field)
- **Backend Endpoint:** `GET /api/v1/dashboard/stats`
- **Role Visibility:** Logistics, Admin
- **Tenant Scope:** Scoped
- **Calculation Logic:** `prisma.user.count({ where: { vehicleType: { not: null }, status: 'active' } })`

## 7. Pending Deliveries
- **Current Mock Source:** React-side array filtering
- **Database Table:** `Delivery`
- **Backend Endpoint:** `GET /api/v1/dashboard/stats`
- **Role Visibility:** Logistics, Admin
- **Tenant Scope:** Scoped
- **Calculation Logic:** `prisma.delivery.count({ where: { status: 'Pending' } })`

## 8. Stock Warnings
- **Current Mock Source:** React-side array filtering `inventory.filter(i => i.quantity <= i.minThreshold)`
- **Database Table:** `Item` or `Stock`
- **Backend Endpoint:** `GET /api/v1/dashboard/stats`
- **Role Visibility:** Inventory, Admin
- **Tenant Scope:** Scoped
- **Calculation Logic:** `prisma.item.count({ where: { stockQuantity: { lte: prisma.item.fields.reorderLevel } } })`
