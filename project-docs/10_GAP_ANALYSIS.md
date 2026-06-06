# 10 GAP ANALYSIS & IMPLEMENTATION ROADMAP

## Current State Evaluation
- **What is missing**: Complete state machine for status workflows, automated ORM-level audit logging, strict tenant-isolation middleware, WebSocket infrastructure.
- **What is broken**: Soft-deletion is implemented on `User` but not deeply cascaded to functional entities like `Order` or `Mission`.
- **What uses dummy data**: Some chart calculations and specific module views in the frontend.
- **What is only UI**: The frontend defines detailed modular structures, but many fallback to UI-only logic when APIs are incomplete.
- **What violates client requirements**: Lack of a distinct, separated database/schema specifically isolating Marketplace Inventory from Client Inventory.

---

## Priority Resolution Plan

### Priority 1: Critical Issues (Data Integrity & Security)
1. **Tenant Isolation Middleware**: Implement strict Row Level Security (RLS) or mandatory Prisma middlewares injecting `{ tenantId: user.tenantId }` onto every query implicitly. Currently, it's manually passed, risking data leakage.
2. **Audit Automation**: Build the Prisma interceptor to fulfill the "Complete Traceability" rule automatically.
3. **Database Consistency**: Add `deletedAt` to all core operational tables to ensure no hard deletes occur.

### Priority 2: Business Issues (Workflows & Flow Connectivity)
1. **Status Engine**: Extract hardcoded string statuses into an approval/workflow engine. Connect `Order Created` -> `Operations Approval` -> `Logistics Dispatch` sequentially.
2. **Inventory Partitioning**: Formally separate the logic paths for Zanezion internal operations vs Client SaaS marketplace stock.
3. **Role Enforcement**: Ensure every single API route strictly utilizes `checkPermission` matching the `RolePermission` DB tables. Remove all legacy "superadmin" string bypasses.

### Priority 3: UI & Experience Issues
1. **Context Decoupling**: Break down `GlobalDataContext.jsx` into smaller contexts (`AuthContext`, `OperationsContext`, `LogisticsContext`) to prevent the entire app from re-rendering on minor state changes.
2. **Real-time Synchronization**: Replace polling mechanisms with WebSockets to fulfill the "If status changes in one portal, it must reflect everywhere immediately" requirement.
3. **Document Generation**: Implement a backend PDF generation library (like Puppeteer or PDFKit) connected to the `Invoice`, `PO`, and `Manifest` UI buttons.

---

## Recommended Implementation Roadmap

**Phase 1: Foundation Lockdown (Backend Only)**
- Implement Automated Audit Logger.
- Implement Strict Tenant Isolation Interceptor.
- Seed definitive final Permissions DB structures.

**Phase 2: Workflow Connectivity (Full Stack)**
- Finalize Procurement Flow (PR -> RFQ -> PO -> GRN).
- Finalize Logistics Flow (Order -> Delivery -> Mission -> POD).
- Connect WebSockets for live status updates.

**Phase 3: Separation & Refinement (Full Stack)**
- Completely separate SaaS Marketplace views from Internal views.
- Refactor Frontend Contexts.
- Implement Backend PDF Print systems.
