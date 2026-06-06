# PHASE 1 CHANGE IMPACT REPORT

## Overview
This report documents the unified architecture approach to fulfilling Phase 1 requirements by expanding existing entities instead of creating new tables.

## Prisma Changes
1. **`Employee` Model**:
   - `+ vehicleType String?`
   - `+ vehiclePlate String?`
   - `+ vehicleModel String?`
2. **`Order` Model**:
   - `+ orderType String @default("PRODUCT")`
   - `+ metadata Json?` (To store passengers, pickup times, or VIP concierge details).
3. **`Mission` Model**:
   - `+ missionType String @default("DELIVERY")`
   - `- deliveryId Int` -> `deliveryId Int?` (Made nullable to support Chauffeur rides without product boxes).
   - `+ orderId Int?` (Direct link to the Client's `Order` for Chauffeur/Concierge).
   - `+ metadata Json?`
4. **`Item` Model**:
   - `+ inventoryType String @default("INTERNAL")`
5. **`InventoryStock` Model**:
   - `+ stockType String @default("INTERNAL")`

## Files to Modify
- `backend/prisma/schema.prisma`
- `backend/src/routes/employee.routes.js`
- `backend/src/controllers/employee.controller.js`
- `backend/src/routes/order.routes.js`
- `backend/src/controllers/order.controller.js`
- `backend/src/routes/mission.routes.js`
- `backend/src/controllers/mission.controller.js`

## API Changes
- `POST /api/v1/orders`: Will now accept `orderType` and `metadata`.
- `POST /api/v1/missions`: Will now accept `missionType`, `orderId`, and `metadata`, allowing assignment without a `deliveryId`.
- `PUT /api/v1/employees/:id`: Will accept vehicle fields.
- `GET /api/v1/users/pending`: Add query filter to auth or user routes to fetch waitlisted Field Staff.

## UI Changes (Required in later phases)
- Chauffeur Booking page must send `orderType: "CHAUFFEUR"` and pass the passenger data as `metadata`.
- Client Tracking must read `metadata` and track `orderType` states.
- Field Staff App must conditionally render vehicle details in the profile.

## Role Impact
- **Field Staff**: Profile is enhanced with vehicle constraints. Registration queue managed by `status="PENDING"`.
- **Concierge**: Leverages `Order` API with `orderType="CONCIERGE"`.
- **Chauffeur**: Leverages `Mission` API with `missionType="CHAUFFEUR"`.

## Migration Risk
**Low**. No data is being deleted. Constraints are being loosened (nullable `deliveryId`) rather than restricted. Defaults (`@default("PRODUCT")`) ensure backward compatibility with existing data.

## Rollback Strategy
1. Revert `schema.prisma`.
2. Delete rows where `orderType != "PRODUCT"` manually via SQL.
3. Drop newly added columns from DB manually.
4. Restart backend.
