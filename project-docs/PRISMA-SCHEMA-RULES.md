# 07-PRISMA-SCHEMA-RULES.md

# ZANEZION PRISMA SCHEMA RULES

Version: 1.0

Purpose:

This document defines all Prisma ORM standards, conventions, naming rules, relation rules, migration rules, and multi-tenant implementation guidelines.

This file is the single source of truth for:

* Prisma Schema
* Database Relations
* Migrations
* Query Standards
* Tenant Isolation
* Audit Tracking

---

# TECHNOLOGY STACK

Database:
MySQL

ORM:
Prisma ORM

Language:
TypeScript

Backend:
Node.js
Express.js

---

# GENERAL RULES

Use Prisma ORM Only

Do Not Use Raw SQL
Unless Performance Critical

All Models Must Be Defined In:

schema.prisma

All Changes Must Go Through:

Prisma Migration

Never Modify Database Manually

---

# MODEL NAMING RULES

Use PascalCase

Examples:

User

Role

Permission

Order

Invoice

PurchaseRequest

GuestRequest

SupportTicket

Warehouse

InventoryItem

ChauffeurBooking

Correct:

model User

model Invoice

model PurchaseOrder

Wrong:

model users

model invoice_table

model order_details_table

---

# TABLE NAMING RULES

Database Tables:

snake_case

Examples:

users

roles

permissions

purchase_requests

purchase_orders

inventory_items

chauffeur_bookings

Prisma Model:

PascalCase

Database Table:

snake_case

Use:

@@map()

Example:

model PurchaseRequest {
}

@@map("purchase_requests")

---

# FIELD NAMING RULES

Use camelCase

Correct:

firstName

lastName

createdAt

updatedAt

tenantId

invoiceNumber

Wrong:

first_name

created_at

Tenant_ID

---

# PRIMARY KEY RULE

Every Table Must Have:

id

Example:

id Int @id @default(autoincrement())

---

# UUID RULE

Every Business Entity Must Have UUID

Example:

uuid String @unique @default(uuid())

Required For:

Users

Orders

Invoices

Projects

Customers

Inventory

Purchase Requests

Support Tickets

Guest Requests

Chauffeur Bookings

---

# TIMESTAMP RULES

Every Business Table Must Have:

createdAt

updatedAt

Example:

createdAt DateTime @default(now())

updatedAt DateTime @updatedAt

---

# SOFT DELETE RULE

Every Business Table Must Have:

deletedAt DateTime?

Example:

deletedAt DateTime?

Never Permanently Delete Records

Application Must Filter:

deletedAt = null

---

# MULTI TENANT RULE

Every Business Table Must Contain:

tenantId

Example:

tenantId Int

Relation:

tenant Tenant @relation(fields: [tenantId], references: [id])

Required Tables:

Users

Projects

Orders

Invoices

Inventory

Warehouses

Payroll

Support

Events

Guest Requests

---

# RELATIONSHIP RULES

Always Use Explicit Relations

Example:

model User {
roleId Int
role Role @relation(fields: [roleId], references: [id])
}

Never Store Relation As Text

Wrong:

roleName String

Correct:

roleId Int

---

# ONE TO MANY RELATIONS

Examples:

Tenant → Users

Project → Tasks

Order → OrderItems

Invoice → InvoiceItems

Vendor → PurchaseOrders

Example:

model Tenant {
users User[]
}

model User {
tenantId Int
tenant Tenant @relation(fields: [tenantId], references: [id])
}

---

# MANY TO MANY RELATIONS

Use Junction Tables

Examples:

RolePermission

UserPermission

ProjectMember

Example:

Role
↔
RolePermission
↔
Permission

---

# ENUM RULES

Use Prisma Enums

Never Store Status As Random Strings

Example:

enum UserStatus {
ACTIVE
INACTIVE
SUSPENDED
}

enum InvoiceStatus {
DRAFT
SENT
PAID
CANCELLED
OVERDUE
}

enum OrderStatus {
DRAFT
PENDING
APPROVED
PROCESSING
COMPLETED
CANCELLED
}

---

# INDEX RULES

Add Indexes For:

tenantId

email

status

createdAt

invoiceNumber

orderNumber

employeeCode

sku

Example:

@@index([tenantId])

@@index([email])

---

# UNIQUE RULES

Email Unique Per Tenant

Example:

@@unique([tenantId,email])

Invoice Number Unique

Order Number Unique

Employee Code Unique

SKU Unique Per Tenant

---

# AUDIT TRAIL RULES

All Critical Modules Must Track:

Created By

Updated By

Approved By

Rejected By

Created At

Updated At

Approved At

Rejected At

---

# CREATED BY RULE

createdBy Int?

Relation:

createdByUser User?

---

# UPDATED BY RULE

updatedBy Int?

Relation:

updatedByUser User?

---

# APPROVAL SYSTEM RULES

Approval Based Modules:

Purchase Requests

Purchase Orders

Invoices

Payroll

Leave Requests

Orders

Store:

approvedBy

approvedAt

rejectedBy

rejectedAt

rejectionReason

---

# FILE STORAGE RULES

Never Store Files In Database

Store Only:

fileUrl

fileType

fileName

fileSize

Example:

documentUrl String?

---

# NOTIFICATION RULES

Every Workflow Event Creates Notification

Store:

title

message

type

isRead

createdAt

---

# AUDIT LOG MODEL RULES

Track:

Create

Update

Delete

Approve

Reject

Login

Logout

Export

Audit Table Fields:

module

action

recordId

oldValues

newValues

ipAddress

userAgent

createdAt

---

# PRISMA MIGRATION RULES

Command:

npx prisma migrate dev

Naming Convention:

feature_name_action

Examples:

create_users

create_orders

create_inventory

add_invoice_status

add_payroll_module

Wrong:

migration1

testmigration

newchanges

---

# PRISMA SEED RULES

Seed Required:

Roles

Permissions

Super Admin

Default Plans

Default Settings

Default Statuses

Command:

npx prisma db seed

---

# QUERY RULES

Always Filter By:

tenantId

Example:

where: {
tenantId: req.user.tenantId
}

Never Return Data
Outside Tenant Scope

---

# SECURITY RULES

Never Expose:

password

refreshToken

secretKeys

Always Use:

select

Example:

select: {
id:true,
name:true,
email:true
}

---

# TRANSACTION RULES

Use Prisma Transactions For:

Order Creation

Invoice Creation

Payroll Processing

Purchase Orders

Inventory Transfer

Example:

prisma.$transaction()

---

# FUTURE SCHEMA MODULES

Attendance

Fleet Management

Vehicle Tracking

Route Optimization

Document Verification

Contract Management

Workflow Engine

Activity Timeline

Chat System

AI Automation

---

# FINAL DEVELOPMENT RULE

Before Creating Any New Model:

1. Check Database Schema Document

2. Check Existing Relations

3. Check Tenant Isolation

4. Check Audit Requirements

5. Check Permission Requirements

6. Create Migration

7. Update Documentation

No Model Should Be Created
Without Following These Rules.
