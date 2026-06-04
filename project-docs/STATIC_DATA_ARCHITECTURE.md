# Static Data Architecture

This document outlines the architecture, data schemas, properties, and relationships of the centralized mock datasets that fuel the Zanson Project in static demo mode.

---

## 1. Local Database Key Registry

All tables are stored as serialized JSON strings inside browser `localStorage` using the prefix `zz_demo_db_`.

| Storage Key | Entities Contained | Initial Record Source | Count |
| :--- | :--- | :--- | :--- |
| `zz_demo_db_users` | Security users, default roles, logins | `USERS` in `data.js` + logins | 14 |
| `zz_demo_db_clients` | Customer accounts, tiers, addresses | `CLIENTS` in `data.js` | 5 |
| `zz_demo_db_vendors` | Registered vendors, performance rates | `VENDORS` + `VENDOR_PERFORMANCE` | 5 |
| `zz_demo_db_inventory` | Asset listings, stock balances, warehouses | `INVENTORY` in `data.js` | 2 |
| `zz_demo_db_invoices` | Billing history, balances, issue dates | `INVOICES` in `data.js` | 2 |
| `zz_demo_db_plans` | SaaS portal billing plans | `ACCESS_PLANS` in `data.js` | 3 |
| `zz_demo_db_events` | Scheduled concierge guest events | `EVENTS` in `data.js` | 2 |
| `zz_demo_db_vehicles` | Logistics fleet vehicle catalog | `LOGISTICS_DATA` in `data.js` | 3 |
| `zz_demo_db_orders` | Customer product orders | Mock order registry | 3 |
| `zz_demo_db_routes` | Delivery route metrics | Mock routes | 3 |
| `zz_demo_db_missions` | Logistics active missions | Mock missions | 2 |
| `zz_demo_db_deliveries` | Logistics delivery statuses | Mock deliveries | 2 |
| `zz_demo_db_purchaseRequests` | Sourcing purchase requests | Mock procurement requests | 2 |
| `zz_demo_db_quotes` | Sourcing supplier quotes | Mock procurement quotes | 2 |
| `zz_demo_db_purchaseOrders` | Issued purchase orders | Mock procurement POs | 1 |
| `zz_demo_db_warehouses` | Distribution warehousing details | Mock warehouses | 2 |
| `zz_demo_db_tickets` | Support desk tickets | Mock CRM tickets | 2 |
| `zz_demo_db_guestRequests` | Hospitality guest requests | Mock concierge requests | 2 |
| `zz_demo_db_luxuryItems` | Luxury items catalog | Mock luxury vault | 2 |
| `zz_demo_db_notifications` | System dashboard alerts | Mock alerts | 2 |
| `zz_demo_db_leave` | Absences & leave requests | Mock HR absence tracker | 2 |
| `zz_demo_db_logs` | Audit trail security ledger | Mock security log events | 2 |

---

## 2. Core Entities Schema Specifications

### A. User Entity (`zz_demo_db_users`)
Represents personnel and client login identities.
```json
{
  "id": "number | string",
  "name": "string (Full Name)",
  "email": "string (Login email)",
  "phone": "string",
  "role": "string (superadmin | admin | operations | procurement | logistics | inventory | concierge | client | staff)",
  "status": "string (active | inactive)",
  "client_id": "number (optional, binds user to a client business record)"
}
```

### B. Client Entity (`zz_demo_db_clients`)
Represents customer organizations and business profiles.
```json
{
  "id": "number",
  "name": "string (Business name)",
  "location": "string (Address)",
  "orders": "number (Completed count)",
  "inventory": "string (Stable | Warning | Low)",
  "status": "string (Active | Inactive)",
  "client_type": "string (Business | Personal | SaaS)",
  "clientType": "string (matches client_type)"
}
```

### C. Order Entity (`zz_demo_db_orders`)
Stores procurement and luxury marketplace orders.
```json
{
  "id": "string (Pattern: ORD-XXX)",
  "client": "string (Client business name)",
  "clientId": "number (Id reference)",
  "product": "string (Product description)",
  "items": "array of objects [{name, qty}]",
  "status": "string (Preparing | On Way | Delivered | Cancelled)",
  "deliveryTime": "string (e.g. 09:15 AM)",
  "total": "number (Value in USD)",
  "address": "string",
  "phone": "string"
}
```

### D. Inventory Asset Entity (`zz_demo_db_inventory`)
Registers warehouse stock lists.
```json
{
  "id": "number",
  "name": "string",
  "category": "string (Beverage | Food | Home | General etc.)",
  "qty": "number (current stock quantity)",
  "quantity": "number (matches qty)",
  "price": "number (unit price in USD)",
  "vendor_id": "number (reference)",
  "vendor_name": "string",
  "warehouse_name": "string",
  "status": "string (Stable | Warning)"
}
```

---

## 3. Dynamic Statistics Integration Schema
When requested, `/dashboard/stats` dynamically aggregates the total statistics from local databases:
*   **Active Clients**: Count of records in `zz_demo_db_clients` matching `status === 'Active'`.
*   **Pending Orders**: Count of records in `zz_demo_db_orders` matching `status !== 'Delivered'`.
*   **Deliveries Today**: Total items count in `zz_demo_db_deliveries`.
*   **Active Events**: Total items count in `zz_demo_db_events`.
*   **Total Revenue**: Aggregated sum of `total` fields from `zz_demo_db_invoices`.
*   **Outstanding Accounts Receivable**: Aggregated sum of unpaid invoice totals in `zz_demo_db_invoices`.
