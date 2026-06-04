# 06-DATABASE-SCHEMA.md

# ZANEZION DATABASE SCHEMA

Version: 1.0

Database:
MySQL

ORM:
Prisma ORM

Architecture:
Multi-Tenant SaaS

---

# DATABASE PRINCIPLES

Every table must contain:

id
uuid
tenantId
createdAt
updatedAt
deletedAt
createdBy
updatedBy

Soft Delete Enabled

Audit Logging Enabled

Multi Tenant Isolation Enabled

---

# CORE TABLES

tenants

plans

subscriptions

users

roles

permissions

role_permissions

user_permissions

audit_logs

notifications

settings

---

# TENANTS

Purpose:

Stores organizations using ZANEZION.

Fields:

id

uuid

companyName

companyEmail

companyPhone

companyAddress

logo

status

subscriptionId

createdAt

updatedAt

deletedAt

Relations:

Tenant
→ Users

Tenant
→ Projects

Tenant
→ Orders

Tenant
→ Inventory

Tenant
→ Procurement

---

# PLANS

Purpose:

Subscription Plans

Fields:

id

uuid

name

description

price

billingCycle

maxUsers

maxStorage

features

status

createdAt

updatedAt

---

# SUBSCRIPTIONS

Purpose:

Purchased plans

Fields:

id

uuid

tenantId

planId

startDate

endDate

amount

paymentStatus

subscriptionStatus

createdAt

updatedAt

Relations:

Subscription
→ Plan

Subscription
→ Tenant

---

# USERS

Purpose:

System Users

Fields:

id

uuid

tenantId

roleId

name

email

phone

password

avatar

status

lastLogin

createdAt

updatedAt

deletedAt

Relations:

User
→ Role

User
→ Tenant

---

# ROLES

Purpose:

RBAC

Fields:

id

name

slug

description

createdAt

updatedAt

---

# PERMISSIONS

Purpose:

Access Control

Fields:

id

module

action

description

createdAt

updatedAt

---

# ROLE_PERMISSIONS

Purpose:

Role Access Mapping

Fields:

id

roleId

permissionId

createdAt

---

# USER_PERMISSIONS

Purpose:

Custom Permission Overrides

Fields:

id

userId

permissionId

createdAt

---

# CLIENTS

Purpose:

Business Clients

Fields:

id

uuid

tenantId

companyName

contactName

email

phone

address

status

createdAt

updatedAt

---

# PROJECTS

Purpose:

Project Management

Fields:

id

uuid

tenantId

projectName

description

priority

status

startDate

endDate

createdBy

createdAt

updatedAt

Relations:

Project
→ Project Members

---

# PROJECT_MEMBERS

Fields:

id

projectId

userId

assignedDate

---

# ORDERS

Purpose:

Orders Management

Fields:

id

uuid

tenantId

orderNumber

customerId

status

amount

description

orderDate

approvedBy

approvedAt

createdAt

updatedAt

---

# ORDER_ITEMS

Fields:

id

orderId

itemName

quantity

price

subtotal

---

# MISSIONS

Purpose:

Operational Tasks

Fields:

id

uuid

tenantId

missionName

description

priority

status

startDate

endDate

createdAt

updatedAt

---

# MISSION_ASSIGNMENTS

Fields:

id

missionId

userId

assignedAt

assignedBy

---

# DELIVERIES

Purpose:

Delivery Tracking

Fields:

id

uuid

tenantId

missionId

driverId

vehicleId

status

deliveryDate

completedAt

createdAt

updatedAt

---

# DELIVERY_TRACKING

Fields:

id

deliveryId

latitude

longitude

status

recordedAt

---

# CUSTOMERS

Fields:

id

uuid

tenantId

name

email

phone

address

status

createdAt

updatedAt

---

# INVENTORY_ITEMS

Purpose:

Inventory

Fields:

id

uuid

tenantId

warehouseId

sku

itemName

description

category

quantity

minimumQuantity

status

createdAt

updatedAt

---

# INVENTORY_TRANSACTIONS

Fields:

id

itemId

transactionType

quantity

remarks

createdAt

---

# WAREHOUSES

Fields:

id

uuid

tenantId

warehouseName

location

managerId

status

createdAt

updatedAt

---

# VENDORS

Fields:

id

uuid

tenantId

vendorName

email

phone

address

status

createdAt

updatedAt

---

# PURCHASE_REQUESTS

Fields:

id

uuid

tenantId

requestNumber

title

description

budget

status

requestedBy

approvedBy

createdAt

updatedAt

---

# QUOTES

Fields:

id

uuid

tenantId

vendorId

purchaseRequestId

amount

validUntil

status

createdAt

updatedAt

---

# PURCHASE_ORDERS

Fields:

id

uuid

tenantId

vendorId

quoteId

poNumber

amount

status

issuedDate

createdAt

updatedAt

---

# INVOICES

Fields:

id

uuid

tenantId

invoiceNumber

customerId

amount

taxAmount

discountAmount

totalAmount

dueDate

status

createdAt

updatedAt

---

# INVOICE_ITEMS

Fields:

id

invoiceId

description

quantity

price

subtotal

---

# PAYMENTS

Fields:

id

uuid

invoiceId

paymentMethod

amount

transactionReference

status

paidAt

---

# EMPLOYEES

Fields:

id

uuid

tenantId

userId

employeeCode

department

designation

joiningDate

salary

status

createdAt

updatedAt

---

# PAYROLLS

Fields:

id

uuid

tenantId

employeeId

basicSalary

allowances

deductions

netSalary

month

status

processedAt

---

# PAYSLIPS

Fields:

id

payrollId

fileUrl

generatedAt

---

# LEAVE_REQUESTS

Fields:

id

uuid

tenantId

employeeId

leaveType

startDate

endDate

reason

status

approvedBy

approvedAt

createdAt

---

# EVENTS

Fields:

id

uuid

tenantId

title

description

venue

eventDate

status

createdAt

updatedAt

---

# GUEST_REQUESTS

Fields:

id

uuid

tenantId

guestName

requestType

description

priority

status

assignedTo

completedAt

createdAt

---

# LUXURY_ITEMS

Fields:

id

uuid

tenantId

itemName

category

availability

status

createdAt

updatedAt

---

# CHAUFFEUR_BOOKINGS

Fields:

id

uuid

tenantId

passengerName

pickupLocation

dropLocation

driverId

vehicleId

status

tripStart

tripEnd

createdAt

---

# SUPPORT_TICKETS

Fields:

id

uuid

tenantId

ticketNumber

subject

description

priority

status

assignedTo

resolvedAt

createdAt

---

# NOTIFICATIONS

Fields:

id

uuid

tenantId

userId

title

message

type

isRead

createdAt

---

# AUDIT_LOGS

Purpose:

Track every action

Fields:

id

uuid

tenantId

userId

module

action

recordId

oldValue

newValue

ipAddress

deviceInfo

createdAt

---

# SETTINGS

Fields:

id

tenantId

companyName

logo

email

phone

timezone

currency

language

securitySettings

notificationSettings

updatedAt

---

# INDEX STRATEGY

Create Index On:

tenantId

email

status

createdAt

orderNumber

invoiceNumber

ticketNumber

employeeCode

sku

---

# SOFT DELETE STRATEGY

Every business table contains:

deletedAt

If deletedAt != null

Record Hidden

Never Permanently Delete

Except:

audit_logs

notifications

---

# MULTI TENANT STRATEGY

Every Business Table Contains:

tenantId

Users can only access:

WHERE tenantId = loggedInUser.tenantId

No Cross Tenant Access Allowed

---

# AUDIT REQUIREMENTS

Create

Update

Delete

Approve

Reject

Login

Logout

Export

Must Create Audit Logs

---

# FUTURE TABLES

attendance

shifts

fleet

vehicles

route_management

gps_tracking

document_management

contracts

chat_messages

activity_timeline

workflow_history
