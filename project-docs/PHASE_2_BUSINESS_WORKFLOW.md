# PHASE 2: BUSINESS WORKFLOW CONNECTIVITY

## Issue 1: Missing Workflow Engine
* **Problem**: "Operations Delivery and Logistics Dispatch same pattern pe chale. Same fields, same workflow."
* **Root Cause**: Hardcoded strings. Operations doesn't automatically trigger Logistics.
* **Affected APIs**: `/api/v1/orders/approve`, `/api/v1/deliveries/dispatch`.
* **Affected Tables**: `Delivery`, `Mission`, `Order`.
* **Risk Level**: High.
* **Fix Strategy**: Build a State Transition service that enforces: `Order Approved -> Delivery Created -> Logistics Notified -> Mission Created`.

## Issue 2: Role Based Assignment & Visibility
* **Problem**: Any employee can currently be assigned any mission. "Delivery Driver sirf delivery dekhe".
* **Root Cause**: `assignee` lookup doesn't enforce Role ID matching.
* **Affected APIs**: `/api/v1/missions`.
* **Affected Tables**: `Mission`, `Employee`, `Role`.
* **Risk Level**: Medium.
* **Fix Strategy**: Add strict `WHERE` clauses to the assignment lookup ensuring the `Employee.userId` has the `FIELD_STAFF` or specific driver role.

## Issue 3: Print and PDF Export
* **Problem**: Missing "Download/Print/View" for POs, Invoices.
* **Root Cause**: Purely UI driven currently.
* **Affected APIs**: `/api/v1/invoices/:id/pdf`, `/api/v1/purchaseOrders/:id/pdf`.
* **Affected Tables**: None.
* **Risk Level**: Low.
* **Fix Strategy**: Integrate PDFKit or Puppeteer to return buffer streams.
