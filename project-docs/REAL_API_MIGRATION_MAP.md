# REAL API MIGRATION MAP

This document maps all frontend components using the mock `api.js` to their real backend equivalents.

## 1. Authentication & Context
**Component:** `Login.jsx` & `AuthContext.jsx`
- **Current Mock:** `POST /auth/login`
- **Real Backend:** `POST /api/v1/auth/login`
- **Required Payload:** `{ email, password }`
- **Expected Response:** `{ success: true, data: { user, token } }`
- **Dependent Context:** `AuthContext`
- **Risk Level:** CRITICAL (Breaks entire app access if failed)

## 2. Dashboard
**Component:** `Dashboard.jsx` (Admin)
- **Current Mock:** `GET /dashboard/stats`
- **Real Backend:** `GET /api/v1/dashboard/stats`
- **Required Payload:** None
- **Expected Response:** `{ success: true, data: { users, orders, revenue, ... } }`
- **Dependent Context:** Auth Role = Admin/SuperAdmin
- **Risk Level:** HIGH (Will throw white screen if response keys don't match exactly)

## 3. RBAC & Users
**Component:** `Users.jsx` & `GlobalDataContext.jsx`
- **Current Mock:** `GET /users`, `GET /roles`
- **Real Backend:** `GET /api/v1/users`, `GET /api/v1/roles`
- **Required Payload:** None
- **Expected Response:** Array of User and Role objects respectively.
- **Dependent Context:** `GlobalDataContext`
- **Risk Level:** HIGH (Used globally across dropdowns)

## 4. Chauffeur Workflow
**Component:** `Chauffeur.jsx` & `useChauffeur.js`
- **Current Mock:** `GET /orders`, `GET /missions`, LocalStorage (`chauffeur_mock_db`)
- **Real Backend:** 
  - `POST /api/v1/orders` (Payload: `{ orderType: 'CHAUFFEUR', metadata: {...} }`)
  - `GET /api/v1/orders?orderType=CHAUFFEUR`
  - `GET /api/v1/missions?missionType=CHAUFFEUR`
- **Expected Response:** Arrays mapped safely with fallback to `[]`.
- **Dependent Context:** None
- **Risk Level:** HIGH (Completely rewriting a standalone local storage hook)

## 5. Concierge Workflow
**Component:** `Concierge.jsx`
- **Current Mock:** `GET /orders`, `GET /luxury-items`
- **Real Backend:** `GET /api/v1/orders?orderType=CONCIERGE`
- **Required Payload:** `{ orderType: 'CONCIERGE', metadata: {...} }`
- **Expected Response:** Arrays of Concierge orders.
- **Dependent Context:** None
- **Risk Level:** MEDIUM

## 6. Field Staff Onboarding
**Component:** `StaffOnboarding.jsx`
- **Current Mock:** `POST /users`
- **Real Backend:** `POST /api/v1/employees`
- **Required Payload:** `{ firstName, lastName, email, phone, roleId, departmentId, designationId, vehicleType, vehiclePlate, vehicleModel, status: 'pending' }`
- **Expected Response:** Employee object
- **Dependent Context:** None
- **Risk Level:** MEDIUM

## 7. Notifications
**Component:** `NotificationsDropdown.jsx`
- **Current Mock:** `GET /notifications`
- **Real Backend:** `GET /api/v1/notifications`
- **Required Payload:** None
- **Expected Response:** `{ success: true, data: [ ... ] }`
- **Dependent Context:** `GlobalDataContext`
- **Risk Level:** LOW (UI will just show 0 notifications if broken)

## 8. General Modules (Inventory, Logistics, Finance)
**Components:** `Inventory.jsx`, `Logistics.jsx`, `Invoices.jsx`
- **Current Mocks:** `GET /inventory`, `GET /deliveries`, `GET /invoices`
- **Real Backend:** `/api/v1/items`, `/api/v1/missions`, `/api/v1/invoices`
- **Risk Level:** MEDIUM (Standard CRUD replacements)
