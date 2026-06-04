# 09-BACKEND-ARCHITECTURE.md

# ZANEZION BACKEND ARCHITECTURE

Version: 2.0

Purpose:

This document defines the backend architecture for ZANEZION using:

* Node.js
* Express.js
* MySQL
* Prisma ORM
* JWT Authentication
* JavaScript

---

# TECHNOLOGY STACK

Runtime:
Node.js

Framework:
Express.js

Language:
JavaScript

Database:
MySQL

ORM:
Prisma ORM

Authentication:
JWT

Password Hash:
bcrypt

Validation:
Zod

File Storage:
Cloudinary

API Documentation:
Swagger

---

# ARCHITECTURE FLOW

Frontend

↓

Routes

↓

Middleware

↓

Controller

↓

Service

↓

Repository

↓

Prisma

↓

MySQL

---

# PROJECT STRUCTURE

backend/

├── prisma/

├── src/

├── uploads/

├── docs/

├── tests/

├── .env

├── package.json

└── README.md

---

# SRC STRUCTURE

src/

├── app.js

├── server.js

├── config/

├── modules/

├── middleware/

├── validations/

├── repositories/

├── services/

├── utils/

├── constants/

└── helpers/

---

# MODULE STRUCTURE

Example:

orders/

├── order.routes.js

├── order.controller.js

├── order.service.js

├── order.repository.js

├── order.validation.js

├── order.constants.js

└── index.js

---

# ROUTES

Responsibilities:

Register APIs

Apply Middleware

Apply Validation

Call Controllers

No Business Logic Allowed

---

# CONTROLLERS

Responsibilities:

Read Request

Read Params

Read Query

Read Body

Call Services

Return Response

No Prisma Queries Allowed

No Business Logic Allowed

---

# SERVICES

Responsibilities:

Business Logic

Status Flow

Approvals

Workflow Management

Notifications

Audit Entries

Examples:

Approve Order

Generate Invoice

Assign Mission

Approve Leave

Generate Payroll

---

# REPOSITORIES

Responsibilities:

Database Queries

Prisma Queries

CRUD Operations

No Business Logic Allowed

---

# PRISMA LAYER

All Database Operations Must Use:

Prisma Client

Location:

prisma/schema.prisma

Never Use Direct SQL

Except Emergency Cases

---

# AUTHENTICATION

Method:

JWT

Flow:

Login

↓

Validate User

↓

Generate Token

↓

Return Token

---

# JWT PAYLOAD

{
userId,
tenantId,
roleId,
email
}

---

# AUTH MIDDLEWARE

authenticate()

checkRole()

checkPermission()

---

# MULTI TENANT SECURITY

Every Table Must Have:

tenantId

Every Query Must Filter:

tenantId

Example:

where: {
tenantId: req.user.tenantId
}

---

# VALIDATION

Library:

Zod

Validate:

Request Body

Request Params

Request Query

---

# ERROR HANDLING

Global Error Handler

Supported Errors:

400 Validation Error

401 Unauthorized

403 Forbidden

404 Not Found

409 Conflict

422 Business Rule Error

500 Server Error

---

# RESPONSE FORMAT

Success:

{
success:true,
message:"",
data:{}
}

Error:

{
success:false,
message:"",
errors:[]
}

---

# FILE UPLOADS

Provider:

Cloudinary

Supported:

Images

PDF

Documents

Store Only URL In Database

---

# AUDIT LOGS

Track:

Create

Update

Delete

Approve

Reject

Login

Logout

Export

Table:

audit_logs

---

# NOTIFICATIONS

Table:

notifications

Events:

Order Created

Mission Assigned

Invoice Generated

Payroll Processed

Leave Approved

Support Ticket Assigned

---

# API DOCUMENTATION

Swagger Required

Every Endpoint Must Have:

Description

Request

Response

Permissions

---

# TESTING

Unit Tests

API Tests

Integration Tests

---

# SECURITY

bcrypt Password Hashing

Helmet

CORS

Rate Limiter

---

# DEVELOPMENT RULES

Every Module Must Contain:

Routes

Controller

Service

Repository

Validation

Constants

---

# REQUIRED MODULES

Auth

Users

Roles

Permissions

Clients

Projects

Orders

Missions

Deliveries

Inventory

Warehouses

Vendors

Purchase Requests

Quotes

Purchase Orders

Invoices

Payroll

Leave

Events

Guest Requests

Luxury Items

Chauffeur

Support

Reports

Dashboard

Settings

Notifications

Audit Logs

---

# FINAL RULE

Before Building Any Feature:

1. Read Overview.md

2. Read Business Requirements.md

3. Read Roles Permissions.md

4. Read Workflows.md

5. Read Database Schema.md

6. Read Prisma Rules.md

7. Read API Architecture.md

8. Follow Backend Architecture.md

No Module Should Be Built
Without Following These Documents.
