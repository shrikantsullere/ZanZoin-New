# 04 DATABASE ARCHITECTURE

## 1. Multi-Tenant Foundation
- `Organization`: Global entity managing multiple tenants.
- `Tenant`: Isolated workspace. Every operational table contains `tenantId` (FK).
- `Subscription` & `Plan`: SaaS billing controls.

## 2. Authentication & Authorization
- `User`: Base identity. Soft delete enabled (`deletedAt`).
- `Role`: RBAC grouping.
- `Permission`, `RolePermission`: Fine-grained backend API locks.
- `Menu`, `RoleMenu`: Frontend UI visibility locks.
- `RefreshToken`: JWT rotation security.

## 3. Human Resources
- `Employee`: Links `User` to `Department` and `Designation`.
- `EmployeeDocument`: Stores licenses, vehicle registration, background checks (`verificationStatus`).

## 4. Supply Chain & Procurement
- `Vendor`: Supplier details.
- `PurchaseRequest` -> `PurchaseRequestItem`: Internal demands.
- `RFQ` -> `Quotation`: Vendor bidding.
- `PurchaseOrder`: Finalized agreements.

## 5. Warehouse & Inventory
- `Warehouse`: Physical locations.
- `ItemCategory`, `ItemUnit`, `Item`: Product definitions.
- `InventoryStock`: Current levels per warehouse.
- `StockMovement`: Ledger of all IN/OUT/TRANSFER actions.
- `GRN` -> `GRNItem`: Goods Receipt Notes bridging POs and Stock.

## 6. Commerce & Delivery
- `Client` & `ClientContact`: Customer CRM.
- `Order` -> `OrderItem`: Customer demands.
- `Delivery` -> `DeliveryItem`: Grouped shipments.
- `Mission`: Specific assignments linking a `Delivery` to an `Employee` (Field Staff).
- `ProofOfDelivery`: End-of-line verification (Signatures/Photos).

## 7. Finance & Tracing
- `Invoice` -> `InvoiceItem`: Billing records.
- `Payment` -> `Receipt`: Ledger.
- `AuditLog`: Global tracing (Stores `oldValue`, `newValue` JSON).
- `Notification`: In-app alert storage.

## Key Architecture Strategies Needed
- **Soft Delete Strategy**: Currently implemented on `User`. Must be expanded to `Order`, `Item`, `Client` to preserve historical integrity.
- **Tenant Isolation Strategy**: Prisma middleware or RLS (Row Level Security) must be enforced at the database level to prevent accidental cross-tenant queries. Currently relies entirely on application logic.
