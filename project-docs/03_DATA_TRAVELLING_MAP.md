# 03 DATA TRAVELLING MAP

## 1. Order Fulfillment Journey
- **WHO creates**: Client (via Client Portal)
- **WHERE stored**: `orders` and `order_items` tables
- **WHO receives**: Operations Role
- **WHO updates**: Operations (approves/rejects)
- **WHO approves**: Operations Manager
- **DATA TRAVELS TO**: `deliveries` table created by Logistics
- **DATA TRAVELS TO**: `missions` table assigned to Field Staff
- **WHO closes**: Field Staff (via POD upload)
- **FINAL DESTINATION**: `invoices` table created for Finance, and `audit_logs`.

## 2. Procurement & Restocking Journey
- **WHO creates**: Any Employee (via Purchase Request)
- **WHERE stored**: `purchase_requests` table
- **WHO receives**: Department Head & Procurement Team
- **DATA TRAVELS TO**: `rfqs` table (sent to external Vendors)
- **DATA TRAVELS TO**: `quotations` table (received from Vendors)
- **WHO approves**: Procurement Lead (selects Quotation, creates PO)
- **DATA TRAVELS TO**: `purchase_orders` table
- **WHO closes**: Warehouse Manager (creates GRN in `grns` table)
- **FINAL DESTINATION**: `inventory_stock` and `stock_movements` updated.

## 3. Personnel Onboarding Journey
- **WHO creates**: Field Staff Applicant
- **WHERE stored**: Initially in a `pending` state (Requires Staff Application Queue table, currently missing)
- **WHO receives**: HR / Admin
- **WHO updates**: Admin reviews `employee_documents`
- **WHO approves**: Admin changes `verificationStatus` to `verified`
- **FINAL DESTINATION**: `users` table status updated to `active`.

## 4. Financial Journey
- **WHO creates**: Finance System (Automated from Delivery/Order completion)
- **WHERE stored**: `invoices` table
- **WHO receives**: Client
- **WHO updates**: Client submits payment
- **WHO approves**: Finance receives webhook or manual entry
- **DATA TRAVELS TO**: `payments` and `receipts` tables
- **WHO closes**: Finance (Status: Paid).
