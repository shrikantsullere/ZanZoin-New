# MODULE 4 FIELD MAPPING REPORT

## 1. Orders UI to Backend Mapping

| UI Field / State | Backend Schema (`Order`) | Notes / Transformation Required |
| :--- | :--- | :--- |
| `item.client` (String) | `clientId` (Int) + `client.companyName` | The UI currently expects a flat string (`"SY Azure"`). The API returns `{ id: 1, client: { companyName: "SY Azure" } }`. The UI must map `item.client?.companyName`. |
| `item.product` / `item.items` | `items[]` relation | UI `Orders.jsx` maps `item.items[0].name`. Backend returns `{ items: [{ item: { name: "..." } }] }`. |
| `item.total` | `totalAmount` (Float) | Requires mapping `totalAmount` to `total` on the React side or vice versa. |
| `item.status` | `status` (String) | Exact match. Backend uses standard string values. |
| `item.priority` | `priority` (String) | Exact match. |
| `item.type` / `item.category` | `orderType` (String) | UI specifies "Procurement", "Chauffeur". This maps cleanly to `orderType`. |

## 2. Missions UI to Backend Mapping

| UI Field / State | Backend Schema (`Mission`) | Notes / Transformation Required |
| :--- | :--- | :--- |
| `item.missionId` / `item.id` | `id` (Int) + `missionNumber` | UI might use custom ID strings. Backend auto-generates `missionNumber`. |
| `item.assignee` / `item.assignedTo`| `assignedEmployeeId` (Int) + `assignee` relation | UI string to relational integer mapping. |
| `item.missionType` | `missionType` (String) | UI: "Delivery", "Chauffeur". Maps cleanly. |
| `item.status` | `status` (String) | UI uses "Pending", "Active", "Completed". Backend uses "assigned", "in_progress", "completed". Need status dictionary mapping. |
| `item.date` | `startDate` / `createdAt` | UI strings like "2026-06-04" map to Prisma `DateTime` fields. |

## 3. UI Creation Forms (Modal Mapping)

When clicking "Add Order" in `Orders.jsx`, the UI builds `formData`.
**Required Transformation before `api.post('/orders')`**:
1. Swap `client` (string name) with a selected `clientId` (integer lookup).
2. Format `items` array to strict `[{ itemId, warehouseId, quantity, unitPrice }]` objects (currently the UI might send flat strings or differing arrays).
3. Append `tenantId` fallback if the UI is run by a Super Admin.

When clicking "Delegate" in `Orders.jsx` (which creates a Mission):
**Required Transformation before `api.post('/missions')`**:
1. Swap `assigneeId` (string/dropdown) to an integer `assignedEmployeeId`.
2. Extract the parent `orderId` or `deliveryId` and append to the mission payload.
