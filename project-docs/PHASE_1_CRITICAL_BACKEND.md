# PHASE 1: CRITICAL BACKEND INFRASTRUCTURE

## Issue 1: Missing Chauffeur & Concierge Entities
* **Problem**: Concierge and Chauffeur modules exist in the UI but have no backend tables or APIs.
* **Root Cause**: Not implemented in Phase 1-9 schema.
* **Affected APIs**: Needs new `/api/v1/chauffeur`, `/api/v1/concierge`.
* **Affected Tables**: Create `ChauffeurRide`, `ConciergeRequest`.
* **Risk Level**: High (Missing core feature).
* **Fix Strategy**: Add models to `schema.prisma`. Create basic CRUD routes and controllers.

## Issue 2: Field Staff Vehicle Constraint & Registration Queue
* **Problem**: Staff assignment must match vehicle type. Registration waitlist missing.
* **Root Cause**: `Vehicle` model missing. `StaffApplication` model missing.
* **Affected APIs**: Needs new `/api/v1/vehicles`, `/api/v1/staff-applications`. Update `/api/v1/mission`.
* **Affected Tables**: Create `Vehicle`, `StaffApplication`. Link `Vehicle` to `Employee`.
* **Risk Level**: High.
* **Fix Strategy**: Modify DB, add tables, enforce check in mission assignment.

## Issue 3: Marketplace vs Internal Inventory
* **Problem**: Marketplace inventory mixes with client inventory.
* **Root Cause**: `InventoryStock` lacks isolation typing.
* **Affected APIs**: `/api/v1/stock`, `/api/v1/items`.
* **Affected Tables**: `InventoryStock`, `Item`. Add `stockType` (INTERNAL, MARKETPLACE) and `inventoryType`.
* **Risk Level**: Medium.
* **Fix Strategy**: Add fields to schema, update queries to filter by type.

## Issue 4: Audit Automation
* **Problem**: Manual audit logging is inconsistent.
* **Root Cause**: Relies on explicit `logAudit()` calls.
* **Affected APIs**: All APIs modifying state.
* **Affected Tables**: `AuditLog`.
* **Risk Level**: High (Client mandate traceability).
* **Fix Strategy**: Build Prisma Extension for automatic auditing.
