# Architecture Diagram & Overview

## Tech Stack
- **Frontend**: React + Vite (ZaneZion Concierge UI)
- **Backend**: Node.js with Express.js (Proposed)
- **Database**: PostgreSQL (Proposed) with Prisma ORM
- **Authentication**: JSON Web Tokens (JWT)

## System Components

1. **Client / Web Application**:
   React frontend using context (`GlobalDataContext`) to manage state and API calls via Axios.
2. **API Gateway / Router (Node.js)**:
   Routes requests to appropriate service controllers.
3. **Services Layer**:
   - `AuthService`: Handles login, token generation, and role validation.
   - `InventoryService`: Manages stock, movements, and alerts.
   - `ProcurementService`: Manages vendors, POs, and quotes.
   - `LogisticsService`: Manages fleet, drivers, and delivery routes.
   - `FinanceService`: Handles invoicing and payments.
4. **Data Access Layer (ORM)**:
   Connects to PostgreSQL database for persistent storage.

## Role-Based Access Control (RBAC)
The architecture must support dynamic RBAC based on the user's role:
- `superadmin`: Unrestricted access.
- `admin`: Full access minus system settings.
- `procurement`: Access to vendors, POs, inventory.
- `logistics`: Access to fleet, deliveries, missions.
- `inventory`: Access to warehouses, stock ledger.
- `client` / `saas_client`: Access only to their own orders and invoices.
