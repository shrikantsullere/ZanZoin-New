# API Removal Report

This document reports on how all backend API endpoints and network services were decoupled and replaced with frontend-only counterparts.

---

## 1. Network Boundary Isolation

The application has been isolated from external servers at the network boundary using a dual-intercept approach:
1.  **Axios Client Decoupling**: The central Axios instantiator file [api.js](file:///d:/ZanZoin-New-shrikant-04-06-2026/frontend/src/utils/api.js) was modified to return a **Mock Axios Client** that mimics a real Axios instance. It intercepts all outgoing HTTP verbs (`GET`, `POST`, `PUT`, `PATCH`, `DELETE`) and routes them to a local JSON parser tied to browser `localStorage`.
2.  **Global `window.fetch()` Interception**: Native fetch calls were wrapped globally in the browser context at application load. This intercepts:
    *   **OSRM Driving Routes API** (`https://router.project-osrm.org/...`) used to calculate kilometer distance and minutes travel duration.
    *   **OpenStreetMap Nominatim Geocoding API** (`https://nominatim.openstreetmap.org/...`) used to map street address text inputs to lat/lng values.
    *   **System settings & public admin REST APIs** (`http://localhost:3000/api/...`) called directly via native fetch.

---

## 2. Decoupled API Endpoint Inventory

Below is the mapping of all decoupled REST routes and how they operate in Static Demo Mode:

| HTTP Verb | Endpoint Path | Original Backend Action | Mock Data Interceptor Logic |
| :--- | :--- | :--- | :--- |
| **POST** | `/auth/login` | Validates credentials, issues JWT token and role permissions. | Verifies user exists in `zz_demo_db_users`. Returns static bypass token and matching user role data. |
| **POST** | `/auth/forgot-password` | Sends SMTP password reset code. | Instantly returns success with test OTP `123456`. |
| **POST** | `/auth/reset-password` | Updates password fields in database. | Returns HTTP 200 success response. |
| **GET** | `/dashboard/stats` | DB aggregation queries on revenue and operations. | Computes live counts and sums dynamically from local collections. |
| **GET** / **PUT** | `/settings/system` | Read/Write global platform variables in DB. | Stores and reads config values in key `zz_system_pricing`. |
| **GET** | `/logistics/pricing` | Reads transport pricing settings. | Reads pricing settings from key `zz_shipping_mode_pricing_v1`. |
| **GET** | `/staff/public/admins` | Lists system admin email directories. | Returns hardcoded mock admin list. |
| **POST** | `/inventory/:id/adjust` | Appends record to ledger; updates balance. | Adjusts item `qty` in `inventory` table and appends log to audit trail. |
| **PATCH** | `/notifications/:id/read` | Sets `is_read` flag in SQL. | Toggles `read: true` for matching notification index. |
| **GET** | `/users` | Lists staff and tenant records. | Reads records from key `zz_demo_db_users`. |
| **POST** | `/users` | Creates a new staff member. | Generates numeric ID and pushes object to user database. |
| **PUT** / **DELETE** | `/users/:id` | Modifies or deletes user record. | Updates/removes target index inside user database. |
| **GET** | `/clients` | Reads client customer organizations list. | Reads records from key `zz_demo_db_clients`. |
| **POST** / **PUT** / **DELETE**| `/clients` / `/clients/:id` | B2B accounts CRUD actions. | Persists operations locally inside client database. |
| **GET** / **POST** / **PUT** | `/vendors` / `/vendors/:id` | Supplier directory CRUD operations. | Manages active/inactive vendors inside vendor database. |
| **GET** / **POST** / **PUT** | `/orders` / `/orders/:id` | Order fulfillment lifecycle operations. | Saves and modifies orders in local order database. |
| **GET** / **POST** / **PUT** | `/inventory` / `/inventory/:id` | Warehouse ledger operations. | Updates stock counts locally inside inventory database. |
| **GET** / **POST** / **PUT** | `/logistics/vehicles` | Logistics fleet configurations. | Registers/updates trucks/boats in fleet database. |
| **GET** / **POST** / **PUT** | `/logistics/deliveries` | Manifest shipping tracking statuses. | Updates delivery coordinates in delivery database. |
| **GET** / **POST** / **PUT** | `/procurement/requests` | Sourcing purchase requisitions. | Pushes requests into local procurement database. |
| **GET** / **POST** / **PUT** | `/procurement/quotes` | Solicits and approves vendor bids. | Manages bid lifecycle inside local quote database. |
| **GET** / **POST** / **PUT** | `/procurement/po` | Confirms purchase order sheets. | Generates supplier PO sheets inside order database. |
| **GET** / **POST** / **PUT** | `/missions` | Active route delivery tasks. | Manages checkbox statuses in mission database. |
| **GET** / **POST** / **PUT** | `/finance/invoices` | Accounts receivable invoice sheets. | Updates invoice totals in invoice database. |
| **GET** / **POST** / **PUT** | `/orders/projects/all` | Operations project cards. | Manages project states in project database. |
| **GET** / **POST** / **PUT** | `/warehouses` | Distribution warehousing node data. | Updates warehouse capacity charts in database. |
| **GET** / **POST** / **PUT** | `/support/tickets` | CRM ticketing issues. | Stores chat transcripts in local ticketing database. |
| **GET** / **POST** / **PUT** | `/support/events` | Concierge luxury booking schedules. | Manages event calendars inside local database. |
| **GET** / **POST** / **PUT** | `/support/guest-requests` | Hospitality guest requests. | Manages request logs inside local database. |
| **GET** / **POST** / **PUT** | `/concierge/luxury-items`| Premium items vault stock list. | Requisitions luxury goods inside local database. |
| **GET** / **POST** / **PUT** | `/staff/leave` | Staff leave tracker. | Registers staff absences in local database. |

---

## 3. Benefits of decoupling
*   **Offline capability**: The demo runs smoothly with zero internet dependency (including mapping and coordinates calculations).
*   **Speed**: Operations execute instantaneously (latency is simulated at a brief 50ms).
*   **Resilience**: No API token expirations, database migration faults, or server downtime issues.
