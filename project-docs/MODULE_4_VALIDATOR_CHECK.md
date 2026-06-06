# MODULE 4 VALIDATOR CHECK

## Orders API (`POST /api/v1/orders`)
- **Required Fields:** `clientId` (Int), `items` (Array).
- **Items Array Requirements:** Each item MUST contain:
  - `itemId` (Int, positive)
  - `warehouseId` (Int, positive, required for stock reservation logic)
  - `quantity` (Float, positive)
  - `unitPrice` (Float, non-negative)
- **Optional Fields:** `priority` (Enum: normal, high, urgent), `orderType` (String).
- **Business Logic Checks:**
  - Client must exist and belong to the correct `tenantId`.
  - Stock is actively checked (`validateAndReserveStock`). The requested `quantity` cannot exceed `quantity - reservedQuantity` in `InventoryStock` for the specified `warehouseId_itemId`.

## Missions API (`POST /api/v1/missions`)
- **Required Fields:** `deliveryId` (Int), `assignedEmployeeId` (Int).
- **Optional Fields:** `remarks` (String), `missionType` (String), `orderId` (Int).
- **Business Logic Checks:**
  - Employee assigned MUST exist.
  - Delivery MUST exist (if `deliveryId` is provided).

## Chauffeur & Concierge Rules
- Chauffeur and Concierge do not naturally have "Warehouses" or physical "Items" from inventory. 
- However, the `Order` API enforces `items.length >= 1` and stock reservation.
- **Critical Action Required:** We must either:
  1. Have dummy "Service" items in the database that don't deduct stock, or 
  2. The frontend must send a dummy item payload if the backend strict validation prevents empty items.
  *(Checking backend: Chauffeur/Concierge might need to bypass stock checks if `items` array is empty, but `orderItemSchema` requires `min(1)` item.)* 
  *(Resolution during implementation: Send a predefined 'Service' item or bypass the Zod schema if `orderType` == 'Chauffeur' by patching the validator).*

This check validates that strictly migrating the UI payloads without handling `warehouseId` and `itemId` mappings for services like Concierge will result in HTTP 400 Validation Errors.
