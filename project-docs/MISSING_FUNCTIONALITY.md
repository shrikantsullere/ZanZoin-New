# Zanson Project - Missing & Mocked Functionality Report

This report catalogs how the Zanson Project has been converted into a completely standalone client-side demo platform using an integrated local relationship database engine, along with how metadata fields are simulated and what gaps remain for a true production deployment.

---

## 1. Zero-Backend Static Demo Architecture

The entire server-side dependency surface of the application has been bypassed and replaced with a centralized **LocalStorage Database** layer (prefixed with `zz_demo_db_*`). 

Rather than executing remote HTTP requests or opening WebSocket streams, the system intercepts network calls through a custom `mockAxios` driver and global `window.fetch()` overrides.

This mock layer contains a **Relationship Engine** that ensures state mutations cascade across modules just like a real ERP/CRM backend:
*   **Checkout & Order Pipeline**: Placing an order creates records in `zz_demo_db_orders`, triggers notifications, updates operational mission logs, auto-spawns logistics deliveries, and generates pending invoices.
*   **Logistics Delivery Pipeline**: Completing a delivery automatically deducts item counts from `zz_demo_db_inventory`, issues restocking alerts if thresholds are crossed, and publishes financial invoices.
*   **Finance & Settlements**: Approving invoices updates total revenue, outstanding balances, and cash-flow charts.
*   **Procurement & Restocking**: Purchase Requests automatically spawn quotes from mock vendors. Approving a quote auto-generates a Purchase Order. Completing the PO receipts immediately updates the warehouse inventory balances.
*   **HR Portal**: Approving staff leave requests dynamically decrements the vacation balances of the target employee in `zz_demo_db_users`.

---

## 2. Mocked Metadata Systems

Several metadata systems are fully simulated and persisted locally:

### A. Comments & Notes System
*   **Applies to**: Orders, Missions, Deliveries, Purchase Orders, Staff Tasks, Support Tickets.
*   **Implementation**: Elements append text objects into a local `notes` or `comments` array within the respective record stored in LocalStorage. These comments persist across page refreshes and are displayed dynamically inside details drawers/modals.

### B. Activity Timelines
*   **Applies to**: Order lifecycles and Delivery tracking.
*   **Implementation**: The timeline is generated dynamically on the client side based on timestamps and status changes of the records. For instance, when an order's status transitions from `admin_review` to `processing` and then `delivered`, the timeline lists each step chronologically with corresponding timestamps.

### C. Attachment Support
*   **Applies to**: Orders, Deliveries, Tasks, Tickets, Leave Requests, Purchase Orders.
*   **Implementation**: Since there is no remote file upload server, files are managed via metadata reference objects. When a user uploads a file, the client reads the file's metadata (name, size, type) and encodes it as a simulation object inside the record's `attachments` array in `localStorage`. 

---

## 3. Remaining Production Integration Gaps

To transition this high-fidelity demonstration workspace into a production-grade multi-tenant platform, the following systems must be implemented:

| Feature / System | Demo Mode Behavior | Production Requirements |
| :--- | :--- | :--- |
| **User Authentication** | Bypassed; login validates credentials against LocalStorage and issues a mock token. | OAuth2, JWT with cookie storage, and integration with an identity provider (e.g., Auth0, Keycloak, or custom database). |
| **Real-Time Telemetry** | Map coordinates are generated via canvas simulation loop intervals (`setInterval`). | WebSockets (Socket.io) streaming real-time GPS telemetry from hardware trackers or mobile client apps. |
| **Map Assets** | Intercepted fetch returning static geocoding coordinates and simulated route distances. | Mapbox, Google Maps, or native OpenStreetMap server tiles for high-fidelity geocoding and routing calculations. |
| **File Storage** | Attachment metadata is stored in local storage, files are not saved to disk. | AWS S3, Cloudinary, or dedicated binary object store server with presigned file upload URLs. |
| **Multi-User Sync** | Data changes are isolated to the single browser instance's LocalStorage. | Centralized database (PostgreSQL/MongoDB) with REST API controllers and Redis cache. |
| **Payment Processor** | Financial settlements are instantly simulated upon click confirmation. | Integration with Payment Gateways (Stripe, PayPal, or bank wire APIs) to verify secure transaction completions. |
| **Notification Push** | Emitted to local in-app array inside `localStorage`. | Push Notification Server (Firebase Cloud Messaging, Apple APNs) and email relays (SendGrid, SES). |
