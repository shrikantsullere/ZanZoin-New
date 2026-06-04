# Demo Mode Implementation Report

This document details the mechanics of the frontend data sync engine, role-switching system, and interactive form handling in the decoupled static version of the Zanson Project.

---

## 1. Local Data Synchronization Engine

The application maintains data cohesion across different components and routes without a central server by utilizing:
1.  **Centralized React Context (`GlobalDataContext.jsx`)**: The global data provider handles state initialization and exposes data-manipulation callbacks (e.g. `addOrder`, `updateDelivery`, `addRoute`, etc.) to the UI.
2.  **API Client Proxy Interceptor (`api.js`)**: All state action calls resolve to the mock client, which manipulates the underlying arrays in `localStorage`.
3.  **Automatic State Refreshing Loop**:
    *   When the UI initiates an update (e.g., calling `updateDelivery(...)`), the context sends a `PUT` request to `/logistics/deliveries/:id`.
    *   The mock client catches the call, updates the target element in `localStorage.getItem('zz_demo_db_deliveries')`, and returns success.
    *   Upon successful response, the context calls its internal `fetchDeliveries()` handler.
    *   This fires a `GET` request to `/logistics/deliveries`, which the mock client intercepts, reads the updated array from `localStorage`, and returns it to the context.
    *   The context updates its React state, triggering a clean re-render across all screens.

This design guarantees that updates performed in any form immediately sync to grids, tables, and KPI cards without reloading the page.

---

## 2. Authentication and Role-Switching Simulation

Because there is no backend authentication server, the login system functions using a pre-authenticated role selector:
*   **Rapid Role Switch tabs**: Located on the login screen, clicking a role switch card auto-fills and logs in using mock credentials:
    *   `superadmin` (Master control admin)
    *   `admin` (Company portal admin)
    *   `operations` (Internal operations staff)
    *   `procurement` (Purchasing manager)
    *   `logistics` (Logistics command center controller)
    *   `inventory` (Stock controller)
    *   `concierge` (Concierge hospitality agent)
    *   `client` (Business account manager)
    *   `staff` (Field operations personnel)
*   **Token & Role Storage**: When logging in, the application stores the dummy token, user role string, user email, and client details object directly in `localStorage`:
    ```javascript
    localStorage.setItem('token', 'dummy-token-operations');
    localStorage.setItem('userRole', 'operations');
    localStorage.setItem('user', JSON.stringify(userData));
    localStorage.setItem('menuPermissions', JSON.stringify([]));
    ```
*   **Router Clearance**: The protected route handlers (`RoleProtectedRoute` and `PrivateDashboardRoute` in `App.jsx`) validate these local keys to mount pages, and the sidebar highlights menu items corresponding to the active role.

---

## 3. Form Handling Mechanics (CRUD Lifecycle)

All forms in the application (such as the event scheduler, dispatch vehicle popup, client creator modal, etc.) implement clean CRUD behavior offline:

*   **Open / Validation**: Forms perform local React state validation. Required text inputs and dropdown selections display error messages or SweetAlert alerts (e.g. `swalWarning`) when submitted empty.
*   **Reset / Cancel**: Forms bind reset/cancel actions directly to component triggers. Clicking "Cancel" or "Close" safely resets temporary state variables and shuts the Modal wrapper (using callbacks like `onClose()` or `setIsModalOpen(false)`).
*   **Create / Save**: Triggers a `POST` or `PUT` request to the mock Axios client, which persists the updated schema directly in the browser.
*   **Delete**: Invokes a `DELETE` call to the mock client, which filters out the matching ID from the array in `localStorage` and saves the result.
