# 13-FRONTEND-ARCHITECTURE.md

# ZANEZION FRONTEND ARCHITECTURE

Version: 1.0

Purpose:

This document defines the frontend architecture, folder structure, component hierarchy, page structure, UI standards, responsive rules, API integration patterns and frontend development guidelines.

Frontend Technology:

React.js

Language:

JavaScript

UI Framework:

Existing ZANEZION UI

API Communication:

Axios

Backend:

Node.js + Express + Prisma

---

# FRONTEND GOALS

Objectives:

* Clean UI Structure
* Reusable Components
* Responsive Design
* Fast Development
* Easy Maintenance
* Backend Integration Ready

---

# APPLICATION FLOW

User

↓

Login

↓

Dashboard

↓

Module

↓

List Page

↓

Create/Edit Modal

↓

API Call

↓

Backend

↓

Response

↓

UI Update

---

# FRONTEND ROOT STRUCTURE

src/

├── assets/

├── components/

├── layouts/

├── pages/

├── services/

├── hooks/

├── context/

├── routes/

├── utils/

├── constants/

├── styles/

├── App.jsx

└── main.jsx

---

# COMPONENT STRUCTURE

components/

common/

tables/

forms/

modals/

cards/

charts/

buttons/

inputs/

dropdowns/

---

# COMMON COMPONENTS

Reusable Components:

Button

Input

Select

Textarea

Modal

Loader

Table

Pagination

Badge

StatusTag

Avatar

Tooltip

ConfirmDialog

---

# LAYOUT ARCHITECTURE

layouts/

MainLayout

AuthLayout

DashboardLayout

---

# MAIN LAYOUT

Contains:

Sidebar

Top Navbar

Page Container

Footer

Notification Panel

---

# SIDEBAR STRUCTURE

Sidebar Controls Navigation

Main Sections:

Dashboard

User Management

Client Management

Projects

Orders

Missions

Deliveries

Inventory

Warehouse

Procurement

Invoices

Payroll

Leave

Events

Guest Requests

Luxury Items

Chauffeur

Support

Reports

Settings

---

# PAGE STRUCTURE

Every Module Must Contain:

List Page

Create Modal

Edit Modal

View Modal

Delete Action

Filters

Search

Pagination

---

# STANDARD MODULE FLOW

Page Load

↓

Fetch API

↓

Render Table

↓

User Action

↓

Open Modal

↓

Submit Form

↓

Call API

↓

Refresh Data

---

# TABLE ARCHITECTURE

Every Table Supports:

Pagination

Search

Sorting

Status Filters

Date Filters

Export

Refresh

Bulk Actions

---

# TABLE ACTION BUTTONS

View

Edit

Delete

Approve

Reject

Assign

Download

Print

Export

---

# FORM ARCHITECTURE

Forms Must Support:

Create

Update

Validation

Error Handling

Loading State

Success State

---

# FORM FLOW

Open Modal

↓

Fill Form

↓

Validate

↓

API Request

↓

Success Message

↓

Refresh Table

---

# MODAL ARCHITECTURE

Every Module Can Have:

Create Modal

Edit Modal

View Modal

Approval Modal

Confirmation Modal

---

# MODAL RULES

Never Navigate To New Page
For Small Actions

Use Modal Instead

Examples:

Create User

Create Order

Create Invoice

Assign Mission

Approve Leave

---

# DASHBOARD ARCHITECTURE

Dashboard Sections:

Statistics Cards

Recent Activities

Notifications

Charts

Quick Actions

Pending Approvals

---

# DASHBOARD CARDS

Examples:

Total Users

Total Orders

Total Revenue

Pending Invoices

Open Tickets

Inventory Alerts

---

# CHARTS

Supported Charts:

Revenue Chart

Order Chart

Payroll Chart

Inventory Chart

Support Ticket Chart

---

# API INTEGRATION ARCHITECTURE

services/

auth.service.js

user.service.js

order.service.js

invoice.service.js

inventory.service.js

---

# API FLOW

Component

↓

Service Layer

↓

Axios

↓

Backend API

↓

Response

↓

Component

---

# AXIOS CONFIGURATION

Single Axios Instance

Responsibilities:

Base URL

JWT Token

Headers

Error Handling

---

# AUTH FLOW

Login

↓

Save Token

↓

Save User

↓

Redirect Dashboard

---

# PROTECTED ROUTES

Protected Pages:

Dashboard

Users

Orders

Invoices

Inventory

Payroll

Support

Reports

Settings

---

# ROLE BASED UI

Frontend Must Check:

Role

Permission

Allowed Actions

---

# EXAMPLES

Admin:

Full Access

Employee:

Limited Access

Receptionist:

Guest Requests

Chauffeur:

Assigned Trips

---

# SEARCH ARCHITECTURE

Every List Page Supports:

Search Input

Status Filter

Date Filter

Refresh

---

# PAGINATION RULES

Default:

10 Records Per Page

Supported:

10

25

50

100

---

# EXPORT FEATURES

Supported Formats:

Excel

CSV

PDF

---

# FILE UPLOAD COMPONENTS

Supported:

Image Upload

Document Upload

PDF Upload

---

# DOCUMENT MODULE FLOW

Upload Document

↓

Store File

↓

Save URL

↓

Display In UI

---

# NOTIFICATION UI

Supports:

Unread Count

Mark Read

Mark All Read

Notification History

---

# SETTINGS MODULE

Company Settings

Profile Settings

Security Settings

Notification Settings

---

# RESPONSIVE RULES

Desktop

Tablet

Mobile

Must Work On:

1920px

1366px

1024px

768px

480px

---

# MOBILE RULES

Sidebar → Drawer

Tables → Scrollable

Cards → Stack Layout

Forms → Full Width

---

# LOADING STATES

Every API Call Must Show:

Loader

Skeleton

Loading Button

---

# ERROR HANDLING UI

Show:

Toast Messages

Validation Errors

API Errors

Network Errors

---

# SUCCESS MESSAGES

Create Success

Update Success

Delete Success

Approval Success

---

# DEVELOPMENT RULES

Before Creating New UI:

1. Check Existing Component

2. Reuse Existing Component

3. Follow Existing Layout

4. Follow Responsive Rules

5. Follow Permission Rules

---

# ANTIGRAVITY RULE

Never Change Existing UI Structure
Without Approval.

Always:

Reuse Components

Reuse Modals

Reuse Tables

Reuse Forms

Follow Existing Design

Do Not Create Duplicate Components.

---

# DEFINITION OF DONE

Frontend Task Complete Only If:

Page Created

API Integrated

Validation Added

Responsive Checked

Loading State Added

Error State Added

Permission Checks Added

Tested On Mobile

Tested On Desktop
