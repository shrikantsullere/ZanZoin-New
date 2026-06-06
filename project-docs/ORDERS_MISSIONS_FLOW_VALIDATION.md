# ORDERS & MISSIONS FLOW VALIDATION

## 1. Flow Overview
The frontend relies on two primary entities for fulfillment tracking:
- **Orders:** Represents customer requests (Chauffeur, Concierge, Logistics, Procurement).
- **Missions:** Represents assigned physical dispatches for employees (Field Staff) to execute an Order.

## 2. Frontend State (Pre-Migration)
- **Orders:** Mapped to `getDB('orders')` via `/orders` endpoints in `api.js`.
- **Missions:** Mapped to `getDB('missions')` via `/orders/projects/all` endpoint in `api.js`.
- **GlobalDataContext:** Fetches both via `fetchOrders` and `fetchProjects/fetchMissions`.
- **Pages:** `Orders.jsx`, `Missions.jsx`, `Dashboard.jsx`, `ProjectTracking.jsx`.

## 3. Backend State (Current Implementation)
- **Database Schema:** 
  - `Order` model exists with `orderType`, `priority`, `status`, `clientId`, `items[]`.
  - `Mission` model exists with `missionType`, `assignedEmployeeId`, `status`, `orderId`, `deliveryId`.
- **API Endpoints:**
  - `GET /api/v1/orders` (and standard CRUD)
  - `GET /api/v1/missions` (and standard CRUD)
- **RBAC / Tenants:** Both tables use `tenantId` for isolation and are protected by `auth.middleware.js` checking `ORDERS:READ` and `MISSIONS:READ`.

## 4. Flow Gaps & Resolutions
1. **Endpoint Mismatch:** The UI uses `/orders/projects/all` to fetch missions. This must be mapped to the standard `/api/v1/missions` endpoint on the backend.
2. **Data Structure Mismatch:** The frontend mock array uses properties like `client` as a string, but the real backend uses a relational `clientId` which populates a nested `client` object. The UI table columns will need mapping to `item.client?.companyName`.
3. **Creation Payload:** Frontend `Orders.jsx` modal sends flat mock data. This must be validated against `order.validator.js` (requires `tenantId`, `clientId`, `orderType`, etc.).
4. **Status Patching:** The UI calls `/orders/:id/status`. This needs to map to a real backend `PUT /api/v1/orders/:id` payload updating the status.

## 5. Workflow Strategy
- **Step 1:** Modify UI to send `clientId` dynamically. (Currently, the UI might send a string name).
- **Step 2:** Refactor `GlobalDataContext` to hit `/api/v1/orders` and `/api/v1/missions`.
- **Step 3:** Strip `/orders` and `/orders/projects/all` from `api.js`.
- **Step 4:** Clean up UI property mappings (`Order.client.name` instead of `Order.client`).
