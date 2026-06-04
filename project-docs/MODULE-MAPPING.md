# 04-MODULE-MAPPING.md

# ZANEZION MODULE MAPPING

Purpose:

Map every sidebar module to:

* Pages
* Tables
* Forms
* Modals
* Buttons
* APIs
* Permissions
* Database Tables

---

# DASHBOARD MODULE

Page:

Dashboard

Widgets:

Total Orders

Total Missions

Total Deliveries

Total Revenue

Pending Invoices

Inventory Alerts

Open Tickets

Payroll Summary

Buttons:

Refresh

Export Dashboard

View Reports

Required APIs:

GET /dashboard/stats

GET /dashboard/charts

GET /dashboard/recent-activities

Tables:

dashboard_widgets

dashboard_metrics

---

# CLIENTS MODULE

Page:

Clients List

Table Columns:

Company Name

Email

Phone

Plan

Status

Created Date

Buttons:

Add Client

Edit Client

View Client

Suspend Client

Activate Client

Delete Client

Export

Modal:

Create Client

Fields:

Company Name

Email

Phone

Address

Subscription Plan

Status

APIs:

GET /clients

GET /clients/:id

POST /clients

PUT /clients/:id

DELETE /clients/:id

POST /clients/:id/suspend

POST /clients/:id/activate

Database:

clients

subscriptions

---

# USERS MODULE

Page:

Users List

Columns:

Name

Email

Role

Status

Created Date

Buttons:

Add User

Edit User

View User

Delete User

Reset Password

Assign Role

Assign Permission

Modal Fields:

Name

Email

Phone

Role

Department

Password

Status

APIs:

GET /users

GET /users/:id

POST /users

PUT /users/:id

DELETE /users/:id

POST /users/:id/reset-password

POST /users/:id/permissions

Database:

users

roles

permissions

---

# PROJECTS MODULE

Page:

Projects

Columns:

Project Name

Status

Priority

Start Date

End Date

Buttons:

Create Project

Edit Project

Delete Project

Assign Team

Close Project

Modal Fields:

Project Name

Description

Priority

Start Date

End Date

Assigned Team

APIs:

GET /projects

POST /projects

PUT /projects/:id

DELETE /projects/:id

POST /projects/:id/assign

POST /projects/:id/close

Database:

projects

project_members

---

# ORDERS MODULE

Page:

Orders

Columns:

Order No

Customer

Amount

Status

Date

Buttons:

Create Order

Edit Order

Approve Order

Reject Order

Assign Team

Generate Invoice

Export

Modal Fields:

Customer

Order Type

Description

Amount

Priority

Status

APIs:

GET /orders

POST /orders

PUT /orders/:id

DELETE /orders/:id

POST /orders/:id/approve

POST /orders/:id/reject

POST /orders/:id/assign

POST /orders/:id/invoice

Database:

orders

order_items

---

# MISSIONS MODULE

Page:

Missions

Columns:

Mission Name

Assigned Staff

Priority

Status

Buttons:

Create Mission

Assign Mission

Update Status

Complete Mission

Cancel Mission

Modal Fields:

Mission Name

Description

Location

Assigned User

Priority

Status

APIs:

GET /missions

POST /missions

PUT /missions/:id

DELETE /missions/:id

POST /missions/:id/assign

POST /missions/:id/complete

POST /missions/:id/cancel

Database:

missions

mission_assignments

---

# DELIVERIES MODULE

Page:

Deliveries

Columns:

Delivery ID

Mission

Driver

Vehicle

Status

Buttons:

Assign Driver

Track Delivery

Start Delivery

Complete Delivery

Modal Fields:

Driver

Vehicle

Route

Delivery Date

APIs:

GET /deliveries

POST /deliveries

PUT /deliveries/:id

POST /deliveries/:id/start

POST /deliveries/:id/complete

Database:

deliveries

delivery_tracking

---

# INVENTORY MODULE

Page:

Inventory

Columns:

Item

SKU

Warehouse

Quantity

Status

Buttons:

Add Item

Edit Item

Transfer Stock

Adjust Stock

Delete Item

Export

Modal Fields:

Item Name

SKU

Category

Warehouse

Quantity

Minimum Quantity

APIs:

GET /inventory

POST /inventory

PUT /inventory/:id

DELETE /inventory/:id

POST /inventory/:id/transfer

POST /inventory/:id/adjust

Database:

inventory_items

inventory_transactions

---

# WAREHOUSE MODULE

Buttons:

Add Warehouse

Edit Warehouse

Delete Warehouse

View Stock

Modal Fields:

Warehouse Name

Location

Manager

Status

APIs:

GET /warehouses

POST /warehouses

PUT /warehouses/:id

DELETE /warehouses/:id

Database:

warehouses

---

# PROCUREMENT MODULE

Sub Modules:

Purchase Requests

Quotes

Purchase Orders

Vendors

---

# PURCHASE REQUESTS

Buttons:

Create Request

Approve

Reject

Close Request

Fields:

Title

Description

Budget

Vendor

Status

APIs:

GET /purchase-requests

POST /purchase-requests

PUT /purchase-requests/:id

POST /purchase-requests/:id/approve

POST /purchase-requests/:id/reject

Database:

purchase_requests

---

# QUOTES

Buttons:

Create Quote

Edit Quote

Approve Quote

Reject Quote

Convert To PO

Fields:

Vendor

Amount

Validity

Status

APIs:

GET /quotes

POST /quotes

PUT /quotes/:id

POST /quotes/:id/approve

POST /quotes/:id/reject

POST /quotes/:id/convert

Database:

quotes

---

# PURCHASE ORDERS

Buttons:

Create PO

Approve PO

Issue PO

Close PO

Fields:

Vendor

Amount

Expected Date

Status

APIs:

GET /purchase-orders

POST /purchase-orders

PUT /purchase-orders/:id

POST /purchase-orders/:id/approve

POST /purchase-orders/:id/issue

Database:

purchase_orders

---

# VENDORS

Buttons:

Add Vendor

Edit Vendor

Delete Vendor

Fields:

Vendor Name

Email

Phone

Address

Status

APIs:

GET /vendors

POST /vendors

PUT /vendors/:id

DELETE /vendors/:id

Database:

vendors

---

# INVOICES

Buttons:

Create Invoice

Send Invoice

Approve Invoice

Mark Paid

Download PDF

Email Invoice

Fields:

Invoice Number

Customer

Amount

Due Date

Status

APIs:

GET /invoices

POST /invoices

PUT /invoices/:id

POST /invoices/:id/send

POST /invoices/:id/pay

Database:

invoices

invoice_items

payments

---

# PAYROLL

Buttons:

Generate Payroll

Approve Payroll

Mark Paid

Download Payslip

Fields:

Employee

Salary

Allowances

Deductions

Month

Status

APIs:

GET /payroll

POST /payroll

PUT /payroll/:id

POST /payroll/:id/process

POST /payroll/:id/pay

Database:

payrolls

payslips

---

# LEAVE MANAGEMENT

Buttons:

Apply Leave

Approve Leave

Reject Leave

Cancel Leave

Fields:

Employee

Leave Type

Start Date

End Date

Reason

Status

APIs:

GET /leave

POST /leave

PUT /leave/:id

POST /leave/:id/approve

POST /leave/:id/reject

Database:

leave_requests

---

# GUEST REQUESTS

Buttons:

Create Request

Assign Staff

Update Status

Complete Request

Fields:

Guest Name

Request Type

Priority

Description

Status

APIs:

GET /guest-requests

POST /guest-requests

PUT /guest-requests/:id

POST /guest-requests/:id/assign

POST /guest-requests/:id/complete

Database:

guest_requests

---

# EVENTS

Buttons:

Create Event

Edit Event

Cancel Event

Fields:

Title

Date

Venue

Status

APIs:

GET /events

POST /events

PUT /events/:id

DELETE /events/:id

Database:

events

---

# LUXURY ITEMS

Buttons:

Add Item

Assign Item

Remove Item

Fields:

Item Name

Category

Availability

Status

APIs:

GET /luxury-items

POST /luxury-items

PUT /luxury-items/:id

DELETE /luxury-items/:id

Database:

luxury_items

---

# CHAUFFEUR

Buttons:

Create Booking

Assign Driver

Start Trip

Complete Trip

Fields:

Passenger

Pickup Location

Drop Location

Vehicle

Driver

Status

APIs:

GET /chauffeur-bookings

POST /chauffeur-bookings

PUT /chauffeur-bookings/:id

POST /chauffeur-bookings/:id/start

POST /chauffeur-bookings/:id/complete

Database:

chauffeur_bookings

---

# SUPPORT

Buttons:

Create Ticket

Assign Ticket

Resolve Ticket

Close Ticket

Fields:

Subject

Description

Priority

Status

APIs:

GET /support-tickets

POST /support-tickets

PUT /support-tickets/:id

POST /support-tickets/:id/assign

POST /support-tickets/:id/resolve

Database:

support_tickets

---

# REPORTS

Buttons:

Generate Report

Export PDF

Export Excel

Schedule Report

Report Types:

Revenue

Orders

Inventory

Payroll

Invoices

Procurement

Support

Audit

APIs:

GET /reports/revenue

GET /reports/orders

GET /reports/inventory

GET /reports/payroll

GET /reports/invoices

Database:

report_exports

---

# SETTINGS

Buttons:

Save Settings

Update Company

Update Security

Update Notifications

APIs:

GET /settings

PUT /settings

Database:

settings

---

# GLOBAL TABLE ACTIONS

Every Table Must Support:

Pagination

Search

Sorting

Filters

Column Visibility

Export CSV

Export Excel

Bulk Actions

Row Actions

View

Edit

Delete

Approve

Reject

---

# GLOBAL MODAL RULES

Every Modal Must Have:

Validation

Error Handling

Loading State

Success State

Cancel Action

Submit Action

Role Permission Check
