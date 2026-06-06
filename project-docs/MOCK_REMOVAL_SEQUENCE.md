# MOCK REMOVAL SEQUENCE

This outlines the precise sequence in which `frontend/src/utils/api.js` interceptors will be disabled and replaced with actual backend calls.

> **CRITICAL RULE**: "Never remove all mocks at once. Replace module-by-module. Prevent white screens."

## 1. Module 1: Auth & API Foundation
- **Goal:** Create a real Axios instance (`axios.js`) while keeping `api.js` alive for unmigrated routes.
- **Action:** Update `Login.jsx` and `AuthContext.jsx` to use the real `/api/v1/auth/login`. Store real JWT.

## 2. Module 2: RBAC & Users
- **Goal:** Update `GlobalDataContext.jsx` to fetch real Roles and Users.
- **Action:** Remove `/users` and `/roles` from `api.js` mock interceptor.

## 3. Module 3: Dashboard
- **Goal:** Connect Admin Dashboard to real backend stats.
- **Action:** Remove `/dashboard/stats` from `api.js` mock. Update `Dashboard.jsx`.

## 4. Module 4: Chauffeur & Field Staff
- **Goal:** Implement the Phase 1 backend schema changes in the UI.
- **Action:** Delete `useChauffeur.js` local storage logic. Update `Chauffeur.jsx` and `StaffOnboarding.jsx`. Disable mock `/missions`.

## 5. Module 5: Concierge & Orders
- **Goal:** Connect Concierge requests and Orders.
- **Action:** Remove `/orders` from `api.js`. Update `Concierge.jsx` and `ClientDashboard.jsx`.

## 6. Module 6: Notifications & Remainder
- **Goal:** Clean up the rest of the generic CRUD mocks.
- **Action:** Update generic tables (Inventory, Finance, Support). Delete `api.js` entirely!
