# 08-API-ARCHITECTURE.md

# ZANEZION API ARCHITECTURE

Version: 1.0

Architecture Style:
REST API

Backend:
Node.js
Express.js

ORM:
Prisma ORM

Database:
MySQL

Authentication:
JWT + Refresh Token

API Version:
v1

Base URL:

/api/v1

---

# STANDARD RESPONSE FORMAT

Success Response

{
"success": true,
"message": "Data fetched successfully",
"data": {}
}

---

Error Response

{
"success": false,
"message": "Validation failed",
"errors": []
}

---

Pagination Response

{
"success": true,
"data": [],
"pagination": {
"page": 1,
"limit": 10,
"total": 100,
"totalPages": 10
}
}

---

# AUTHENTICATION ARCHITECTURE

Module:

Auth

Routes:

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/v1/auth/login` | Authenticate user | No |
| POST | `/api/v1/auth/refresh-token` | Rotate JWT token | No |
| POST | `/api/v1/auth/forgot-password` | Send reset link | No |
| POST | `/api/v1/auth/reset-password` | Reset password | No |
| POST | `/api/v1/auth/logout` | Revoke tokens | Yes |
| GET | `/api/v1/auth/profile` | Get current user | Yes |
| PUT | `/api/v1/auth/profile` | Update profile | Yes |
| PUT | `/api/v1/auth/change-password` | Change password | Yes |

## 2. User Management (`/api/v1/users`)
| Method | Endpoint | Description | Auth Required | Permission |
|--------|----------|-------------|---------------|------------|
| GET | `/api/v1/users` | List users | Yes | `USERS:READ` |
| GET | `/api/v1/users/:id` | Get user | Yes | `USERS:READ` |
| POST | `/api/v1/users` | Create user | Yes | `USERS:CREATE` |
| PUT | `/api/v1/users/:id` | Update user | Yes | `USERS:UPDATE` |
| DELETE | `/api/v1/users/:id` | Soft delete user | Yes | `USERS:DELETE` |

## 3. Roles & Permissions (`/api/v1/roles`, `/api/v1/permissions`)
| Method | Endpoint | Description | Auth Required | Permission |
|--------|----------|-------------|---------------|------------|
| GET | `/api/v1/roles` | List roles | Yes | `ROLES:READ` |
| POST | `/api/v1/roles` | Create role | Yes | `ROLES:CREATE` |
| POST | `/api/v1/roles/:id/permissions` | Assign permissions | Yes | `ROLES:ASSIGN_PERMISSIONS` |
| GET | `/api/v1/permissions` | List permissions | Yes | `PERMISSIONS:READ` |

## 4. System Settings (`/api/v1/settings`)
| Method | Endpoint | Description | Auth Required | Permission |
|--------|----------|-------------|---------------|------------|
| GET | `/api/v1/settings` | Get settings | Yes | `SETTINGS:READ` |
| PUT | `/api/v1/settings/:key` | Update setting | Yes | `SETTINGS:UPDATE` |

## 5. Notifications (`/api/v1/notifications`)
| Method | Endpoint | Description | Auth Required | Permission |
|--------|----------|-------------|---------------|------------|
| GET | `/api/v1/notifications` | List notifications | Yes | `NOTIFICATIONS:READ` |
| PUT | `/api/v1/notifications/mark-all-read` | Mark all read | Yes | `NOTIFICATIONS:UPDATE` |

## 6. Plans (`/api/v1/plans`)
| Method | Endpoint | Description | Auth Required | Permission |
|--------|----------|-------------|---------------|------------|
| GET | `/api/v1/plans` | List plans | Yes | `PLANS:MANAGE` |
| POST | `/api/v1/plans` | Create plan | Yes | `PLANS:MANAGE` |
| PUT | `/api/v1/plans/:id` | Update plan | Yes | `PLANS:MANAGE` |
| PUT | `/api/v1/plans/:id/activate` | Activate plan | Yes | `PLANS:MANAGE` |
| DELETE | `/api/v1/plans/:id` | Delete plan | Yes | `PLANS:MANAGE` |

## 7. Subscriptions (`/api/v1/subscriptions`)
| Method | Endpoint | Description | Auth Required | Permission |
|--------|----------|-------------|---------------|------------|
| GET | `/api/v1/subscriptions` | List subscriptions | Yes | `SUBSCRIPTIONS:MANAGE` |
| POST | `/api/v1/subscriptions` | Create sub | Yes | `SUBSCRIPTIONS:MANAGE` |
| PUT | `/api/v1/subscriptions/:id/upgrade` | Upgrade sub | Yes | `SUBSCRIPTIONS:MANAGE` |
| PUT | `/api/v1/subscriptions/:id/cancel` | Cancel sub | Yes | `SUBSCRIPTIONS:MANAGE` |
| PUT | `/api/v1/subscriptions/:id/renew` | Renew sub | Yes | `SUBSCRIPTIONS:MANAGE` |

## 8. Organizations (`/api/v1/organizations`)
| Method | Endpoint | Description | Auth Required | Permission |
|--------|----------|-------------|---------------|------------|
| GET | `/api/v1/organizations` | List organizations | Yes | `ORGANIZATIONS:MANAGE` |
| POST | `/api/v1/organizations` | Create org | Yes | `ORGANIZATIONS:MANAGE` |
| PUT | `/api/v1/organizations/:id` | Update org | Yes | `ORGANIZATIONS:MANAGE` |
| PUT | `/api/v1/organizations/:id/suspend` | Suspend org | Yes | `ORGANIZATIONS:MANAGE` |

## 9. Tenants (`/api/v1/tenants`)
| Method | Endpoint | Description | Auth Required | Permission |
|--------|----------|-------------|---------------|------------|
| GET | `/api/v1/tenants` | List tenants | Yes | `TENANTS:MANAGE` |
| POST | `/api/v1/tenants` | Create tenant | Yes | `TENANTS:MANAGE` |
| PUT | `/api/v1/tenants/:id` | Update tenant | Yes | `TENANTS:MANAGE` |
| PUT | `/api/v1/tenants/:id/suspend` | Suspend tenant | Yes | `TENANTS:MANAGE` |
| DELETE | `/api/v1/tenants/:id` | Delete tenant | Yes | `TENANTS:MANAGE` |

---

# LOGIN FLOW

Email + Password
↓
Validate Credentials
↓
Generate JWT
↓
Generate Refresh Token
↓
Return User + Permissions

Response:

accessToken

refreshToken

user

permissions

---

# JWT PAYLOAD

{
userId,
tenantId,
roleId,
email,
permissions
}

---

# AUTH MIDDLEWARE

authenticate()

verifyToken()

checkTenant()

checkRole()

checkPermission()

---

# ROLE PERMISSION MIDDLEWARE

Usage:

checkPermission(
"users.create"
)

checkPermission(
"orders.approve"
)

checkPermission(
"inventory.update"
)

---

# USERS API

GET /users

GET /users/:id

POST /users

PUT /users/:id

DELETE /users/:id

POST /users/:id/reset-password

POST /users/:id/assign-role

POST /users/:id/assign-permission

---

# CLIENTS API

GET /clients

GET /clients/:id

POST /clients

PUT /clients/:id

DELETE /clients/:id

POST /clients/:id/suspend

POST /clients/:id/activate

---

# ROLES API

GET /roles

GET /roles/:id

POST /roles

PUT /roles/:id

DELETE /roles/:id

---

# PERMISSIONS API

GET /permissions

POST /permissions

PUT /permissions/:id

DELETE /permissions/:id

---

# PROJECTS API

GET /projects

GET /projects/:id

POST /projects

PUT /projects/:id

DELETE /projects/:id

POST /projects/:id/assign

POST /projects/:id/close

---

# ORDERS API

GET /orders

GET /orders/:id

POST /orders

PUT /orders/:id

DELETE /orders/:id

POST /orders/:id/approve

POST /orders/:id/reject

POST /orders/:id/assign

POST /orders/:id/complete

POST /orders/:id/invoice

---

# MISSIONS API

GET /missions

GET /missions/:id

POST /missions

PUT /missions/:id

DELETE /missions/:id

POST /missions/:id/assign

POST /missions/:id/start

POST /missions/:id/complete

POST /missions/:id/cancel

---

# DELIVERIES API

GET /deliveries

GET /deliveries/:id

POST /deliveries

PUT /deliveries/:id

DELETE /deliveries/:id

POST /deliveries/:id/dispatch

POST /deliveries/:id/start

POST /deliveries/:id/complete

GET /deliveries/:id/tracking

---

# INVENTORY API

GET /inventory

GET /inventory/:id

POST /inventory

PUT /inventory/:id

DELETE /inventory/:id

POST /inventory/:id/transfer

POST /inventory/:id/adjust

GET /inventory/low-stock

GET /inventory/out-of-stock

---

# WAREHOUSE API

GET /warehouses

GET /warehouses/:id

POST /warehouses

PUT /warehouses/:id

DELETE /warehouses/:id

---

# VENDORS API

GET /vendors

GET /vendors/:id

POST /vendors

PUT /vendors/:id

DELETE /vendors/:id

---

# PURCHASE REQUEST API

GET /purchase-requests

GET /purchase-requests/:id

POST /purchase-requests

PUT /purchase-requests/:id

DELETE /purchase-requests/:id

POST /purchase-requests/:id/approve

POST /purchase-requests/:id/reject

POST /purchase-requests/:id/close

---

# QUOTES API

GET /quotes

GET /quotes/:id

POST /quotes

PUT /quotes/:id

DELETE /quotes/:id

POST /quotes/:id/approve

POST /quotes/:id/reject

POST /quotes/:id/convert

---

# PURCHASE ORDERS API

GET /purchase-orders

GET /purchase-orders/:id

POST /purchase-orders

PUT /purchase-orders/:id

DELETE /purchase-orders/:id

POST /purchase-orders/:id/approve

POST /purchase-orders/:id/issue

POST /purchase-orders/:id/receive

POST /purchase-orders/:id/close

---

# INVOICES API

GET /invoices

GET /invoices/:id

POST /invoices

PUT /invoices/:id

DELETE /invoices/:id

POST /invoices/:id/send

POST /invoices/:id/pay

POST /invoices/:id/download

POST /invoices/:id/email

---

# PAYROLL API

GET /payrolls

GET /payrolls/:id

POST /payrolls

PUT /payrolls/:id

DELETE /payrolls/:id

POST /payrolls/:id/process

POST /payrolls/:id/pay

POST /payrolls/:id/payslip

---

# LEAVE API

GET /leave-requests

GET /leave-requests/:id

POST /leave-requests

PUT /leave-requests/:id

DELETE /leave-requests/:id

POST /leave-requests/:id/approve

POST /leave-requests/:id/reject

---

# EVENTS API

GET /events

GET /events/:id

POST /events

PUT /events/:id

DELETE /events/:id

---

# GUEST REQUESTS API

GET /guest-requests

GET /guest-requests/:id

POST /guest-requests

PUT /guest-requests/:id

DELETE /guest-requests/:id

POST /guest-requests/:id/assign

POST /guest-requests/:id/complete

---

# LUXURY ITEMS API

GET /luxury-items

GET /luxury-items/:id

POST /luxury-items

PUT /luxury-items/:id

DELETE /luxury-items/:id

---

# CHAUFFEUR API

GET /chauffeur-bookings

GET /chauffeur-bookings/:id

POST /chauffeur-bookings

PUT /chauffeur-bookings/:id

DELETE /chauffeur-bookings/:id

POST /chauffeur-bookings/:id/assign-driver

POST /chauffeur-bookings/:id/start

POST /chauffeur-bookings/:id/complete

---

# SUPPORT API

GET /support-tickets

GET /support-tickets/:id

POST /support-tickets

PUT /support-tickets/:id

DELETE /support-tickets/:id

POST /support-tickets/:id/assign

POST /support-tickets/:id/resolve

POST /support-tickets/:id/close

---

# REPORTS API

GET /reports/revenue

GET /reports/orders

GET /reports/inventory

GET /reports/payroll

GET /reports/invoices

GET /reports/procurement

GET /reports/support

GET /reports/audit

---

# DASHBOARD API

GET /dashboard/stats

GET /dashboard/charts

GET /dashboard/recent-activities

GET /dashboard/notifications

---

# SETTINGS API

GET /settings

PUT /settings

PUT /settings/security

PUT /settings/notifications

PUT /settings/company

---

# NOTIFICATIONS API

GET /notifications

POST /notifications/read

POST /notifications/read-all

DELETE /notifications/:id

---

# AUDIT LOG API

GET /audit-logs

GET /audit-logs/:id

---

# SEARCH ARCHITECTURE

Every List API Must Support:

?page=1

?limit=10

?search=

?sortBy=

?sortOrder=

?status=

?startDate=

?endDate=

---

# VALIDATION ARCHITECTURE

Use:

Zod

or

Joi

Validation Layers:

Request Body

Request Params

Request Query

---

# FILE UPLOAD ARCHITECTURE

Storage:

Cloudinary

or

AWS S3

Endpoints:

POST /upload/image

POST /upload/document

POST /upload/avatar

---

# ERROR CODES

400
Validation Error

401
Unauthorized

403
Forbidden

404
Not Found

409
Conflict

422
Business Rule Error

500
Server Error

---

# API SECURITY RULES

All APIs Protected

Except:

Login

Forgot Password

Reset Password

Refresh Token

---

# MULTI TENANT RULE

Every Query Must Include:

tenantId

Example:

where: {
tenantId: req.user.tenantId
}

Never Return Another Tenant's Data

---

# DEVELOPMENT RULE

Every Module Must Have:

Route

Controller

Service

Validation

Prisma Repository

Permission Check

Audit Log

Notification Trigger

Swagger Documentation

Unit Tests
