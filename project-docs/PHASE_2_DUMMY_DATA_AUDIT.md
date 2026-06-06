# PHASE 2: DUMMY DATA AUDIT

## Massive Discovery: The Mock API Interceptor
The entire frontend application is currently operating under a completely mocked environment. `frontend/src/utils/api.js` intercepts **all** Axios requests using a custom `mockAxios` object and routes them to the browser's `localStorage` (`zz_demo_db_...`). It even overrides the global `window.fetch`. 

**This means the frontend is entirely disconnected from the real Node.js backend.**

### 1. Hardcoded Mock Arrays Found (`api.js` & `data.js`)
- `defaultUsers`, `defaultClients`, `defaultVendors`
- `defaultInventory`, `defaultInvoices`, `defaultPlans`
- `defaultVehicles`, `defaultRoutes`, `defaultMissions`
- `defaultOrders`, `defaultDeliveries`
- `defaultPurchaseRequests`, `defaultQuotes`, `defaultPurchaseOrders`
- `defaultWarehouses`, `defaultTickets`, `defaultGuestRequests`
- `defaultLuxuryItems`, `defaultNotifications`
- `defaultLeave`, `defaultLogs`

### 2. Hardcoded Features/Hooks
- `useChauffeur.js`: Manages Chauffeur data using a dedicated `localStorage` key (`chauffeur_mock_db`).
- `Login.jsx`: OTP system uses hardcoded text: "DUMMY OTP".
- `ClientBalance.jsx`: Balance logic is entirely faked using random calculations.
- `Dashboard.jsx`: Some chauffeur metrics are randomized directly in the UI.

### 3. Missing Real Hooks
We need to generate real React Query / Axios hooks for the following new backend features built in Phase 1:
- `useOrders` (with type filtering for CONCIERGE and CHAUFFEUR)
- `useMissions` (with type filtering for CHAUFFEUR)
- `useEmployees` (fetching vehicle details)
- `useAuth` (managing pending waitlisted staff)

### Conclusion
To execute Phase 2 successfully, `api.js` must be rewritten to export a true Axios instance pointing to `http://localhost:3000/api/v1`. This will instantly break all views since the real database is empty and requires strict JWT / Role permissions. I must carefully implement this migration module-by-module.
