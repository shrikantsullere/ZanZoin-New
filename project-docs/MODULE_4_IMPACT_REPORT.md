# MODULE 4 IMPACT REPORT: Orders & Missions

## 1. Files to Modify

**API Layer:**
- `frontend/src/utils/api.js`: Purge interceptors `key: 'orders'` and `key: 'missions'` mapping to `/orders/projects/all`.
- `frontend/src/services/api/setupAxios.js`: Ensure Axios properly attaches JWT.

**Data Layer:**
- `frontend/src/context/GlobalDataContext.jsx`:
  - `fetchOrders()`: Update endpoint mapping.
  - `fetchMissions()` / `fetchProjects()`: Map cleanly to `/api/v1/missions`.
  - `addOrder()`, `updateOrder()`, `updateMissionStatus()`: Swap simulated state mutation with real `POST`/`PUT`/`PATCH` API calls.

**UI Layer:**
- `frontend/src/pages/Admin/Orders.jsx`
- `frontend/src/pages/Admin/Missions.jsx`
- `frontend/src/pages/Admin/Chauffeur.jsx`
- `frontend/src/pages/Admin/Concierge.jsx`
- *Impact:* Table rendering logic must accommodate nested relational data (e.g., `client: { companyName: 'XYZ' }` vs `client: 'XYZ'`).

## 2. Prisma Changes
**None required.** 
The backend schema (`schema.prisma`) already fully supports `Order`, `Mission`, and relational constraints. Tenant isolation is natively built-in.

## 3. API Changes
**Frontend Calls Only.** 
The backend `order.routes.js` and `mission.routes.js` are fully prepared. The frontend simply needs to migrate from calling `/orders` (which hits the mock DB) to `/api/v1/orders` (which hits the node backend).

## 4. UI Changes
- **Data Rendering:** Changing `item.client` to `item.client?.companyName`.
- **Modals (Creation):** Mapping form input fields like `client` string to `clientId` integers before passing payloads to `addOrder()`.

## 5. Role Impact
- `Concierge` and `Logistics` roles will inherit strict visibility based on the existing `checkPermission('ORDERS:READ')` backend middleware. 
- A failure point will be if the database `RoleMenu` seeder doesn't have permissions assigned for these roles (resulting in an expected 403 Forbidden).

## 6. Migration Risk
**Moderate.**
- Risk of UI breaking due to `undefined` nested properties if `client` relation is not passed back from backend. 
- Risk of form submission failure (`400 Bad Request`) if Zod validators strictly demand IDs but the UI attempts to send strings.

## 7. Rollback Strategy
If critical failures occur across Orders and Missions:
1. Re-inject `getDB('orders')` mock handlers into `api.js`.
2. Revert `GlobalDataContext.jsx` `fetchOrders` block.
