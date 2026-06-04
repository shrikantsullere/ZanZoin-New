# ZaneZion Backend Development Rules

## 1. Request Handling & Validation
- All incoming POST/PUT requests must validate payload schema.
- Return standard HTTP status codes:
  - `200 OK` / `201 Created` for success.
  - `400 Bad Request` for validation errors.
  - `401 Unauthorized` for missing/invalid tokens.
  - `403 Forbidden` for role restriction violations.
  - `404 Not Found` for missing resources.

## 2. API Response Standard
All API responses must follow a standard JSON envelope format to match the frontend expectations:
```json
{
  "success": true,
  "data": { ... } // or array
}
```
Errors:
```json
{
  "success": false,
  "error": "Message describing the error"
}
```

## 3. Role-Based Access Rules (RBAC)
- **Superadmin**: Full access to all endpoints.
- **Admin**: Can view/edit all resources EXCEPT system settings and `superadmin` users.
- **Client**: Can only fetch/edit resources where `client_id` matches their own `user.company_id`.
- **Department Staff** (Logistics, Procurement, Inventory, Finance, Concierge): Can only perform POST/PUT/DELETE on their respective domains. They have read-only (`GET`) access to cross-departmental data (like Orders or Clients).

## 4. Soft Deletes
- Do not physically delete records for critical data (Orders, Invoices, Inventory Movements). Use a `deleted_at` timestamp or `status = 'Inactive'` for auditing purposes.

## 5. Security & Tokens
- Tokens must expire (e.g., 24 hours).
- Passwords must be hashed using bcrypt or argon2. Never return passwords in API responses.
- Environment variables must be used for DB credentials and secret keys.
