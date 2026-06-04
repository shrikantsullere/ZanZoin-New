# API Specification for ZaneZion Backend

## Base URL
`/api/v1`

## Authentication & Users
- `POST /auth/login`: Authenticate and return JWT token and user role.
  - Body: `{ email, password }`
- `GET /auth/me`: Validate token and return current user details.
- `GET /users`: List all platform users (Staff, Clients, Admins).
- `POST /users`: Create new user.

## Clients & SaaS
- `GET /clients`: List all clients.
- `POST /clients`: Create a new business or personal client.
- `GET /saas/plans`: List available SaaS subscription plans.
- `GET /saas/requests`: List incoming SaaS client requests.

## Vendors & Procurement
- `GET /vendors`: List approved vendors.
- `POST /vendors`: Add a new vendor.
- `GET /procurement/requests`: List internal purchase requests.
- `POST /procurement/po`: Generate a Purchase Order (PO).
- `GET /procurement/quotes`: List quotes from vendors.

## Inventory & Warehousing
- `GET /inventory`: List all stock items.
- `POST /inventory`: Add new inventory item.
- `GET /inventory/alerts`: Fetch low-stock alerts.
- `GET /inventory/movements`: Fetch stock ledger/history.
- `GET /warehouses`: List all warehouse locations.

## Orders & Projects
- `GET /orders`: List all customer orders.
- `POST /orders`: Create a new order.
- `GET /orders/projects`: List active projects (long-term).

## Logistics & Fleet
- `GET /logistics/deliveries`: List delivery schedules.
- `GET /logistics/vehicles`: List fleet vehicles.
- `GET /logistics/routes`: List defined delivery routes.
- `GET /missions`: Active driver missions.

## Finance
- `GET /finance/invoices`: List all generated invoices.
- `POST /finance/invoices`: Generate a new invoice.
- `PUT /finance/invoices/:id/pay`: Mark invoice as paid.

## Support & Concierge
- `GET /support/tickets`: List IT/Support tickets.
- `GET /support/events`: List concierge events.
- `GET /concierge/luxury-items`: List requested luxury items.
- `GET /support/audits`: Fetch system audit logs.
