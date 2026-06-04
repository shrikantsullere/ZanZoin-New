# End-to-End Operational Flow (Backend Implementation Guide)

This document describes the exact data flow the backend must support, mirroring the current frontend's logic.

## 1. Onboarding Cycle
- A new SaaS Company registers.
- Admin approves it via the SaaS Management portal (`PUT /saas/requests/:id/status`).
- Client logs in and sets their White-label Branding in Settings.

## 2. Order Lifecycle
1. **Creation**: Client places an order via the Marketplace (`POST /orders`).
2. **Status**: Initial status is `Pending Review`.
3. **Approval**: Super Admin reviews and updates status to `Approved` (`PUT /orders/:id`).
4. **Mission Launch**: Operations manager assigns the order to a Logistics Protocol.

## 3. Fulfillment Cycle (Dual Mission Types)
- **Logistics Dispatch**: Operations creates a delivery mission (`POST /logistics/deliveries`).
  - Mission types are distinguished: `Chauffeur Mission` vs `Logistics Mission`.
  - Dimensions (L x W x H) and multiple assets are supported in a single manifest.
- **Tracking**: Field staff updates status: `Accepted` -> `En Route` -> `Delivered` (`PUT /missions/:id/status`).
- **Proof of Delivery**: Signature and photo are captured and uploaded.

## 4. Procurement & Sourcing Cycle (PO System)
- **Purchase Requests (PR)**: Auto-generated when inventory drops below threshold.
- **Quotes**: Vendor quotes are approved and converted into Purchase Orders (`POST /procurement/po`).
- **Goods Receiving**: Warehouse receives goods partially or fully (`PUT /procurement/po/:id/approve-receipt`).
- **Inventory Sync**: Stock levels are automatically synchronized based on received quantities.
- **Separation**: Marketplace inventory and Client inventory are strictly segregated in the backend database.

## 5. Chauffeur Protocol Sequence
- Client books chauffeur (`POST /support/guest-requests` or dedicated chauffeur endpoint).
- Service types: One Way, Round Trip, or Daily.
- Concierge vets and confirms the request.
- Logistics dispatches the confirmed mission to a driver.

## 6. Staff Task Delegation & Payroll
- **Delegation**: Super Admin delegates tasks (`POST /staff/assignments`) with priority levels.
- **Leaves**: Staff requests leave (`POST /staff/leave`), Admin approves/rejects.
- **Financials**: Completed deliveries trigger invoice generation (`POST /finance/invoices`). Staff payroll logs auto-generate based on shifts (`POST /staff/clock-in` / `clock-out`).

## Note on Architecture Implementation
Ensure that the backend `Orders`, `Missions`, `Deliveries`, and `Invoices` services communicate seamlessly, as a single action (like marking a delivery complete) cascades updates across multiple domains.
