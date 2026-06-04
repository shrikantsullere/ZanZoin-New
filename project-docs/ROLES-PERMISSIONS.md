# 03-ROLES-PERMISSIONS.md

# ZANEZION ROLE & PERMISSION MATRIX

Version: 1.0

Purpose:

This document defines all user roles, permissions, access levels, approval rights, and system visibility rules.

This document is the source of truth for:

* Backend Authorization
* RBAC System
* Prisma Permissions
* Middleware Access Control
* Sidebar Visibility
* API Access Control

---

# ROLE HIERARCHY

SUPER ADMIN
│
├── CLIENT
│
├── ADMIN
│
├── OPERATIONS
│
├── PROCUREMENT
│
├── LOGISTICS
│
├── INVENTORY
│
├── CONCIERGE
│
└── FIELD STAFF

---

# ACCESS LEVELS

VIEW

Can view records

---

CREATE

Can create records

---

EDIT

Can modify records

---

DELETE

Can delete records

---

APPROVE

Can approve workflows

---

REJECT

Can reject workflows

---

EXPORT

Can export reports

---

MANAGE

Full control

---

# SUPER ADMIN

Description:

Platform Owner

Highest Level Access

Responsibilities:

Manage Platform

Manage Clients

Manage Plans

Manage Subscriptions

Manage Billing

Manage Global Settings

Manage Roles

Manage Permissions

Access:

Dashboard

Clients

Users

Roles

Permissions

Plans

Subscriptions

Reports

Settings

Audit Logs

Notifications

Permissions:

VIEW ✔

CREATE ✔

EDIT ✔

DELETE ✔

APPROVE ✔

REJECT ✔

EXPORT ✔

MANAGE ✔

---

# CLIENT

Description:

Organization Owner

Responsibilities:

Manage Own Organization

Manage Employees

Manage Operations

Manage Procurement

Manage Inventory

Manage Reports

Permissions:

VIEW ✔

CREATE ✔

EDIT ✔

DELETE ✔

APPROVE ✔

EXPORT ✔

MANAGE ✔

Cannot Access:

Global Plans

Platform Clients

Platform Settings

---

# ADMIN

Description:

Organization Administrator

Responsibilities:

Manage Daily Business Operations

Manage Teams

Manage Reports

Manage Workflows

Permissions:

VIEW ✔

CREATE ✔

EDIT ✔

DELETE ✔

APPROVE ✔

EXPORT ✔

Cannot:

Manage Subscription Plans

Manage Global Platform

---

# OPERATIONS

Description:

Operations Team

Responsibilities:

Projects

Orders

Missions

Deliveries

Permissions:

Projects

View ✔

Create ✔

Edit ✔

Delete ✖

Approve ✔

Orders

View ✔

Create ✔

Edit ✔

Approve ✔

Reject ✔

Export ✔

Missions

View ✔

Create ✔

Assign ✔

Edit ✔

Close ✔

Deliveries

View ✔

Track ✔

Update ✔

---

# PROCUREMENT

Description:

Purchasing Department

Responsibilities:

Purchase Requests

Quotes

Purchase Orders

Vendors

Invoices

Permissions:

Purchase Requests

View ✔

Create ✔

Edit ✔

Approve ✔

Reject ✔

Quotes

View ✔

Create ✔

Edit ✔

Approve ✔

Purchase Orders

View ✔

Create ✔

Edit ✔

Approve ✔

Vendors

View ✔

Create ✔

Edit ✔

Delete ✖

Invoices

View ✔

Create ✔

Approve ✔

Export ✔

---

# LOGISTICS

Description:

Logistics Team

Responsibilities:

Deliveries

Transportation

Fleet

Tracking

Permissions:

Deliveries

View ✔

Update ✔

Track ✔

Complete ✔

Fleet

View ✔

Create ✔

Edit ✔

Routes

View ✔

Create ✔

Edit ✔

Tracking

View ✔

Update ✔

---

# INVENTORY

Description:

Inventory Department

Responsibilities:

Warehouses

Stock

Audits

Inventory Control

Permissions:

Inventory

View ✔

Create ✔

Edit ✔

Adjust ✔

Transfer ✔

Warehouses

View ✔

Create ✔

Edit ✔

Inventory Reports

View ✔

Export ✔

Stock Audits

View ✔

Create ✔

Approve ✔

---

# CONCIERGE

Description:

Luxury Guest Services

Responsibilities:

Guest Requests

VIP Services

Events

Luxury Items

Chauffeur

Permissions:

Guest Requests

View ✔

Create ✔

Assign ✔

Complete ✔

Events

View ✔

Create ✔

Edit ✔

Luxury Items

View ✔

Create ✔

Edit ✔

Chauffeur

View ✔

Create ✔

Assign ✔

Track ✔

---

# FIELD STAFF

Description:

Mobile Workforce

Responsibilities:

Assigned Missions

Deliveries

Attendance

Leave Requests

Permissions:

View Assigned Tasks ✔

Update Task Status ✔

View Own Attendance ✔

Submit Attendance ✔

Apply Leave ✔

View Own Payroll ✔

Cannot:

Approve

Delete

Manage Users

Manage Inventory

Manage Procurement

---

# MODULE ACCESS MATRIX

MODULE                         SUPER ADMIN   CLIENT   ADMIN   OPS   PROC   LOGI   INV   CONC   STAFF

Dashboard                          ✔          ✔       ✔      ✔      ✔      ✔      ✔      ✔      ✔

Clients                            ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✖      ✖

Users                              ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✖      ✖

Roles                              ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✖      ✖

Permissions                        ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✖      ✖

Projects                           ✔          ✔       ✔      ✔      ✖      ✖      ✖      ✖      ✖

Orders                             ✔          ✔       ✔      ✔      ✖      ✖      ✖      ✖      ✖

Missions                           ✔          ✔       ✔      ✔      ✖      ✖      ✖      ✖      ✔

Deliveries                         ✔          ✔       ✔      ✔      ✖      ✔      ✖      ✖      ✔

Inventory                          ✔          ✔       ✔      ✖      ✖      ✖      ✔      ✖      ✖

Warehouses                         ✔          ✔       ✔      ✖      ✖      ✖      ✔      ✖      ✖

Procurement                        ✔          ✔       ✔      ✖      ✔      ✖      ✖      ✖      ✖

Purchase Requests                  ✔          ✔       ✔      ✖      ✔      ✖      ✖      ✖      ✖

Quotes                             ✔          ✔       ✔      ✖      ✔      ✖      ✖      ✖      ✖

Purchase Orders                    ✔          ✔       ✔      ✖      ✔      ✖      ✖      ✖      ✖

Invoices                           ✔          ✔       ✔      ✖      ✔      ✖      ✖      ✖      ✖

Payroll                            ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✖      View Own

Leave                              ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✖      Apply Only

Guest Requests                     ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✔      ✖

Events                             ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✔      ✖

Luxury Items                       ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✔      ✖

Chauffeur                          ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✔      ✖

Reports                            ✔          ✔       ✔      ✔      ✔      ✔      ✔      ✔      ✖

Settings                           ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✖      ✖

Audit Logs                         ✔          ✔       ✔      ✖      ✖      ✖      ✖      ✖      ✖

---

# BACKEND AUTHORIZATION RULES

Every API must check:

1. Authentication

2. Role

3. Permission

4. Tenant Ownership

5. Resource Ownership

---

# JWT TOKEN PAYLOAD

Store:

userId

tenantId

roleId

permissions

email

status

---

# FUTURE ROLES

Finance

HR

Vendor

Guest

Customer

Regional Manager

Branch Manager

Support Agent
