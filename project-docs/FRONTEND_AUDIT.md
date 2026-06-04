# Zanson Project - Frontend Audit & Page Inventory

This document details the complete frontend architecture of the Zanson Project (`d:\ZanZoin-New-shrikant-04-06-2026\frontend`). It catalogs all available pages, their routes, purpose, user role eligibility, and UI/interactive components as of June 4, 2026.

---

## 1. Global Navigation & Layout Architecture

The application uses React Router DOM for routing. Core navigation is structured using:
*   **Sidebar Navigation (`Sidebar.jsx`)**: Renders custom navigation based on the user's logged-in role (`localStorage.getItem('userRole')` / `currentUser.role`).
*   **Topbar Navigation (`Topbar.jsx`)**: Displays dynamic connection statuses, quick actions, role indicators, and profile buttons.
*   **Layout Wrapper (`DashboardLayout.jsx`)**: Integrates Sidebar, Topbar, and the sub-route renderer wrapped with framer-motion animations.

---

## 2. Page & Route Inventory

Below is the exhaustive catalog of every route and screen defined in `src/App.jsx`.

| Page Name | Route URL | Purpose of Page | Eligible Roles | Components & UI Elements Used |
| :--- | :--- | :--- | :--- | :--- |
| **Landing Page** | `/` | Guest entry point highlighting features and membership tiers. | Guest / Anonymous | Plans Card Grid, Form, Buttons |
| **Login** | `/` `/login` | System entry & role switching. Includes "Rapid Role Switch" panel. | Guest / Anonymous | Form, Buttons, Role Selectors, Alert |
| **Sign Up** | `/signup` | Corporate & Individual account registrations. | Guest / Anonymous | Tabs (Personal/Business), Forms, Buttons |
| **Staff Application** | `/staff-signup` | Job application/clearance request for personnel. | Guest / Anonymous | Step Wizard Form, Inputs, Buttons, SweetAlert |
| **Main Dashboard** | `/dashboard` | Hub routing users to role-specific dashboard views. | All Roles (Internal/External) | Recharts (Line/Bar Charts), KPIs, Action Lists |
| **Clients Management** | `/dashboard/clients` | Master registry of customers and client organizations. | Admin, Super Admin, Operations, Client, SaaS Client | Table, Modals, Forms, Search, Status Badges |
| **Vendors Registry** | `/dashboard/vendors` | Partner list, supplier profiles, and supply chain registry. | Admin, Super Admin, Client, SaaS Client, Procurement, Operations, Inventory | Table, Modals, Forms, Buttons, Filters |
| **Order Control** | `/dashboard/orders` | Operations & Concierge master order registry. | Admin, Super Admin, Operations, Procurement, Concierge, Client, SaaS Client | Table, OrderModal, Status Badges, Filters |
| **StockHub Inventory** | `/dashboard/inventory` | Real-time asset tracking and warehousing ledger. | Admin, Super Admin, Inventory, Concierge, Client, SaaS Client | Table, Audit Scheduler, Dropdowns, Search |
| **Intelligence & Revenue** | `/dashboard/reports` | Financial health, liquidity allocation, and invoice trends. | Admin, Super Admin, Client, SaaS Client | Recharts (Line/Pie), PDF Generator, Filters, DatePicker |
| **HQ Personnel** | `/dashboard/users` | Staff registry, shift assignments, and terminal permissions. | Admin, Super Admin, Client, SaaS Client, Operations, Procurement, Logistics, Inventory, Concierge | Table, Modal, Role Presets, Search |
| **Staff Audits** | `/dashboard/staff-audits` | Verification log of personnel credentials and logs. | Admin, Super Admin, Client, SaaS Client | Table, Search, Filter Tabs |
| **System Settings** | `/dashboard/settings` | Multi-tenant configurations, billing status, and profile edits. | All Roles | Forms, Toggles, Save Buttons |
| **User Profile** | `/dashboard/profile` | Current user identity details and cryptographic key. | All Roles | Profile Form, Security Clearances, Key generator |
| **Security Protocol** | `/dashboard/roles-permissions` | Role-based access control matrix and overrides. | Admin, Super Admin, Client, SaaS Client | Permissions Checklist Matrix, Save Buttons |
| **Payroll Ledger** | `/dashboard/payroll` | Net pay calculate. NIB deductions, medical insurance, overtime. | Admin, Super Admin, Client, SaaS Client, Procurement | Table, Invoices, Payment Status, PDF Export |
| **Leave & Absence** | `/dashboard/leave` | Leave balance tracker, request forms, and approvals. | All Internal Roles | Form, Request Calendar, Table, Action Buttons |
| **Invoices** | `/dashboard/invoices` | Transactional billings and Accounts Receivable tracking. | Admin, Super Admin, Client, SaaS Client, Operations, Procurement, Logistics, Inventory, Concierge, Staff | Table, Print Modal, Status Badges |
| **Plans & SaaS** | `/dashboard/plans` | Account tiers and plan activations. | Client, SaaS Client, Customer, Super Admin (SaaS Management) | Card Matrix, Purchase Modals, Toggles |
| **Support Helpdesk** | `/dashboard/support-tickets` | Ticket resolution tracker and chat hub. | All Roles | Ticket List, Chat Drawer, Status Badges |
| **SaaS Tenant Clients** | `/dashboard/saas-clients` | Control panel for SaaS instances and client licenses. | Admin, Super Admin, Client, SaaS Client | Table, SaaS License Status, Config Modals |
| **Operations Projects** | `/dashboard/projects` | Mission control for operational projects and tasks. | Admin, Super Admin, Operations, Client, SaaS Client | Card Grid, Tasks, Status Badges, Forms |
| **Deliveries Tracking** | `/dashboard/deliveries` | Manifest distribution status ledger. | Admin, Super Admin, Operations, Logistics, Client, SaaS Client | Table, Driver assignment form, Status Badges |
| **Missions Management** | `/dashboard/missions` | Dynamic routing of active tactical missions. | Admin, Super Admin, Operations, Logistics, Client, SaaS Client | Table, Task Checklist, Map Link |
| **Purchase Requests** | `/dashboard/purchase-requests` | Procurement requests initiation and approvals. | Admin, Super Admin, Procurement, Client, Customer | Table, Form Modal, Approval Toggles |
| **Quotes Ledger** | `/dashboard/quotes` | Bid evaluation sheet and supplier responses. | Admin, Super Admin, Procurement, Client, Customer | Table, Form, Decision Buttons |
| **Audit Protocol Logs** | `/dashboard/audits` | Comprehensive audit trail of operations, stock, and payroll. | Admin, Super Admin, Procurement, Inventory, Client, Customer | Table, CSV Exporter, View Modal |
| **Purchase Orders** | `/dashboard/purchase-orders` | Verified supplier agreements. | Admin, Super Admin, Procurement, Client, Customer | Table, PO Builder, Print Action, Approval buttons |
| **Fleet Arsenal** | `/dashboard/fleet` | Logistics assets, maintenance status, and diagnostics. | Admin, Super Admin, Logistics, Client | Cards, Diagnostic status badges, Search, Dispatch |
| **Logistics Routes** | `/dashboard/logistics-routes` | Established routes, distances, and efficiency stats. | Logistics Only | Table, Route Creator Form, Navigation link |
| **Logistics Tracking** | `/dashboard/logistics-tracking` | Real-time map simulation and unit location trackers. | Logistics Only | Map Canvas, Map Pins, Active Unit List |
| **Logistics Urgent** | `/dashboard/logistics-urgent` | High-priority dispatch requests and alerts. | Logistics Only | Table, High-priority cards, Action triggers |
| **Warehouses Hub** | `/dashboard/warehouses` | Distribution nodes and volume capacities. | Admin, Super Admin, Inventory, Client | Card Grid, Warehouse Modal, Capacity Bar Charts |
| **Inventory Alerts** | `/dashboard/inventory-alerts` | Alert ledger for low stock, spoilage, or expiration. | Inventory Only | Alert table, Action triggers |
| **Concierge Events** | `/dashboard/events` | Luxury event scheduler and bookings list. | Concierge, Admin, Customer, Client | Calendar, Book Event Form, Status Badges |
| **Guest Requests** | `/dashboard/guest-requests` | Hospitality bookings and request ledger. | Concierge, Admin, Customer, Client | Table, Request Forms, Status Badges |
| **Luxury Items Ledger** | `/dashboard/luxury-items` | Vault inventory of luxury goods. | Concierge, Admin, Customer, Client | Table, Requisition Forms, Status Badges |
| **Concierge Access Plans** | `/dashboard/vip-access` | Decommissioning and tracking of Concierge access logs. | Concierge, Admin | Access Logs Table, Decommissioning Dialog |
| **Chauffeur Dispatch** | `/dashboard/chauffeur` | Premium chauffeur booking and scheduling. | Concierge, Admin, Customer, Client | Chauffeur Grid, Booking form, Status Badges |
| **Marketplace Store** | `/dashboard/store` | Product catalogs and purchase cart checkout. | Customer, Client | Product Cards, Cart Drawer, Checkout Form |
| **Track Delivery** | `/dashboard/track-delivery` | Visual delivery tracker for individual customers. | Customer, Client | Order Timeline, Map Pin |
| **Membership Page** | `/dashboard/membership` | Customer level (Platinum/Gold/Silver) status hub. | Customer, Client | Premium Tier Cards, Subscription Actions |

---

## 3. UI Component Categories (Global Registry)

The application adheres to a clean, componentized design system. Component usages across these screens are structured as:

*   **Cards**: Used for KPI display, Fleet vehicle registries, Warehouse capacity logs, Operations Projects, and Plan Tiers.
*   **Tables**: Reusable `<Table />` component with pagination, action handlers, column configs, sorting, and inline viewing.
*   **Forms**: Standard modular forms embedded in Modals for CRUD operations, validating input fields, and prompting with SweetAlerts.
*   **Modals**: Custom `<Modal />` and `<OrderModal />` wrappers providing standardized backdrop overlays and close actions.
*   **Drawers**: Used for Shopping Cart checkouts and Ticket Helpdesk chats.
*   **Tabs**: Used in the Login Page, Signup Wizard, and Audits manifest.
*   **Filters**: Dropdowns and input fields for searching, filtering tables, or picking date ranges.
*   **Buttons**: Styling classes `btn-primary`, `btn-secondary`, and `btn-danger` tailored with HSL golden accents.
*   **Status Badges**: Configured via `<StatusBadge />` rendering colors `accent`, `success`, `warning`, and `danger`.
*   **Charts**: Leveraged from the `recharts` library for trend reports and allocation graphs.
