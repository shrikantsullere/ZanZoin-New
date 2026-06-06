# 09 AUDIT ENGINE

## Current State
- `AuditLog` table exists with `oldValue` (JSON) and `newValue` (JSON).
- Very few controllers actually write to it. It requires manual `logAudit()` calls inside API services.

## Required Architecture (To meet strict traceability)
Manual logging is error-prone and often forgotten by developers.

### Database / ORM Level Hook
We must implement a **Prisma Middleware** or **Prisma Extension**.

```javascript
prisma.$use(async (params, next) => {
  const before = ['update', 'delete'].includes(params.action) 
    ? await prisma[params.model].findUnique({ where: params.args.where })
    : null;

  const result = await next(params);

  if (['create', 'update', 'delete'].includes(params.action)) {
    // Asynchronously write to AuditLog table without blocking the request
    prisma.auditLog.create({
      data: {
        module: params.model,
        action: params.action.toUpperCase(),
        oldValue: before ? JSON.stringify(before) : null,
        newValue: result ? JSON.stringify(result) : null,
        performedBy: CURRENT_CONTEXT_USER_ID, // Needs AsyncLocalStorage integration
      }
    });
  }
  return result;
});
```

### Traceability Requirements
- **Who**: Extracted from JWT token via `AsyncLocalStorage`.
- **When**: Handled by DB timestamp.
- **What**: Automated JSON diffing.
- **IP/Device**: Captured at the API Gateway/Middleware layer and passed to the audit engine.
