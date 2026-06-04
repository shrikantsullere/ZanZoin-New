# Database Schema Design

This outlines the essential collections/tables required by the backend to serve the ZaneZion frontend.

## 1. Users
- `id` (Primary Key)
- `name` (String)
- `email` (String, Unique)
- `password_hash` (String)
- `role` (Enum: superadmin, admin, procurement, operations, logistics, inventory, concierge, client, staff)
- `company_id` (Foreign Key -> Clients.id, Nullable)
- `status` (Enum: Active, Inactive)

## 2. Clients
- `id` (Primary Key)
- `name` (String)
- `location` (String)
- `client_type` (Enum: Business, Personal, SaaS)
- `status` (Enum: Active, Warning, Inactive)
- `orders_count` (Int)

## 3. Vendors
- `id` (Primary Key)
- `name` (String)
- `rating` (Float)
- `delivery_score` (Float)
- `status` (Enum: Active, Blacklisted, Inactive)

## 4. Inventory
- `id` (Primary Key)
- `name` (String)
- `quantity` (Int)
- `location` (String)
- `status` (String: Stable, Low, Warning)
- `warehouse_id` (Foreign Key -> Warehouses.id)

## 5. Orders
- `id` (Primary Key)
- `client_id` (Foreign Key -> Clients.id)
- `product` (String)
- `status` (String: Pending, Preparing, On Way, Delivered)
- `delivery_time` (DateTime)

## 6. Logistics (Deliveries)
- `id` (Primary Key)
- `driver_id` (Foreign Key -> Users.id)
- `vehicle_id` (Foreign Key)
- `route` (String)
- `eta` (String)
- `status` (String)

## 7. Invoices (Finance)
- `id` (Primary Key)
- `order_id` (Foreign Key -> Orders.id)
- `client_id` (Foreign Key -> Clients.id)
- `amount` (Float)
- `status` (Enum: Paid, Unpaid, Pending)
- `due_date` (DateTime)
