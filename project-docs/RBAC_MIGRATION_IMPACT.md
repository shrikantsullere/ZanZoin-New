# RBAC MIGRATION IMPACT

This document maps the user and role management screens to their real backend equivalents.

## 1. Global Users Fetch
- **Component:** `GlobalDataContext.jsx` (`fetchStaff`)
- **Current Mock Source:** `GET /users` (intercepted by `api.js` using `defaultUsers` array)
- **Real API Endpoint:** `GET /api/v1/users`
- **Required Role:** Any authorized role (Admin/HR for full list, others for subset)
- **Required Permission:** `USERS:READ`
- **Expected Response Structure:** `{ success: true, data: { users: [...] } }`

## 2. Global Roles Fetch
- **Component:** `GlobalDataContext.jsx` (`fetchRoles`)
- **Current Mock Source:** `GET /roles` (intercepted by `api.js`)
- **Real API Endpoint:** `GET /api/v1/roles`
- **Required Role:** Super Admin / Admin
- **Required Permission:** `ROLES:READ`
- **Expected Response Structure:** `{ success: true, data: [...] }`

## 3. Sidebar & Menu Visibility
- **Component:** `Sidebar.jsx`, `Layout.jsx`
- **Current Mock Source:** Local storage `menuPermissions` (injected via fake `/auth/login`)
- **Real API Endpoint:** Already migrated via Module 1. Real JWT now provides real menu permissions.
- **Required Role:** Any
- **Required Permission:** Various (per module)
- **Expected Response Structure:** Provided by auth context.

## 4. User Creation & Updates
- **Component:** `Users.jsx` (Admin panel)
- **Current Mock Source:** `POST /users`, `PUT /users/:id`
- **Real API Endpoint:** `POST /api/v1/users`, `PUT /api/v1/users/:id`
- **Required Role:** Super Admin / Admin
- **Required Permission:** `USERS:CREATE`, `USERS:UPDATE`
- **Expected Response Structure:** `{ success: true, data: {...user} }`

## 5. Staff Onboarding (Field Staff)
- **Component:** `StaffOnboarding.jsx`, `StaffSignup.jsx`
- **Current Mock Source:** `POST /users` (creates fake user)
- **Real API Endpoint:** `POST /api/v1/employees`
- **Required Role:** None (Public endpoint or special signup token)
- **Expected Response Structure:** `{ success: true, data: {...employee} }`

## Validation Checklist
- [ ] Login role matches DB role (Migrated in Module 1).
- [ ] Sidebar permissions come from DB (Migrated in Module 1).
- [ ] Menu visibility comes from DB.
- [ ] User creation comes from DB.
- [ ] Employee listing comes from DB.
- [ ] Role assignment comes from DB.
- [ ] No hardcoded role arrays remain in context.
