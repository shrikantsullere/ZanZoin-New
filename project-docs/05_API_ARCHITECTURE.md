# 05 API ARCHITECTURE

## Standard Pattern
All APIs must follow the format:
`[METHOD] /api/v1/{module}/{resource}`

Middleware sequence:
1. `authenticate` (Verifies JWT, extracts `tenantId`, validates `user.status`)
2. `checkPermission(MODULE, ACTION)` (Verifies DB-backed RolePermission)
3. `validate(schema)` (Joi/Zod payload validation)
4. Controller logic
5. Response wrapper

## Core Modules Analysis

### 1. Delivery Module
`POST /api/v1/delivery`
- **Role**: Logistics
- **Creates**: Delivery Record, updates `Order.status` to `ready_for_delivery`.
- **Stores**: `deliveries`, `delivery_items`
- **Triggers**: Notification to Field Staff Queue.
- **Creates**: Audit Log (Delivery Created).

`PUT /api/v1/delivery/:id/mission`
- **Role**: Operations / Logistics
- **Creates**: Assigns `Employee` to `Mission`.
- **Stores**: `missions`
- **Triggers**: Push notification to Field Staff App.

### 2. Client Order Module
`POST /api/v1/orders`
- **Role**: Client
- **Creates**: New Order Draft.
- **Stores**: `orders`, `order_items`
- **Triggers**: Email to Operations Lead.

### 3. Procurement Module
`POST /api/v1/procurement/grn`
- **Role**: Inventory Manager
- **Creates**: Goods Receipt Note.
- **Stores**: `grns`, `stock_movements`. Updates `inventory_stock`.
- **Triggers**: Notification to Procurement.
- **Validates**: Must perfectly match `PurchaseOrder` limits.

## Broken/Missing Aspects
- **Transaction Safety**: Complex endpoints (like GRN creation or Order creation) must use `prisma.$transaction` to ensure database integrity if a step fails. Not universally implemented.
- **Audit Abstraction**: Currently, controllers manually write to `AuditLog`. A Prisma interceptor/middleware should automatically capture state changes.
