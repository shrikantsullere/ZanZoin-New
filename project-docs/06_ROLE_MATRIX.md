# 06 ROLE MATRIX

## Hierarchy Overview
1. **SUPER_ADMIN**: God mode. Bypass restrictions, manages tenants.
2. **SAAS_ADMIN**: Top level within a single Tenant.
3. **OPERATIONS**: Core dispatch and business flow management.
4. **PROCUREMENT**: Internal demand handling.
5. **INVENTORY**: Stock management.
6. **LOGISTICS**: Transport and tracking management.
7. **FIELD_STAFF** (Drivers/Chauffeurs): Execution agents.
8. **BUSINESS_CLIENT**: External demand creators.
9. **CONCIERGE**: VIP client handlers.
10. **VENDOR**: Supply side.

## Permission Mapping
| Role | View | Create | Edit | Delete | Approve | Assign | Export |
|---|---|---|---|---|---|---|---|
| **Operations** | Orders, Deliveries | Deliveries, Missions | Missions | None | Orders | Field Staff | Yes |
| **Logistics** | Fleet, Missions | Missions | Tracking | None | None | Vehicles | Yes |
| **Inventory** | Stock, GRNs | GRNs | StockMovements| None | GRNs | None | Yes |
| **Procurement** | RFQs, POs | RFQs, POs | Quotes | Draft POs | POs | Vendors | Yes |
| **Client** | Own Orders | Orders | Draft Orders | Draft Orders | POD | None | No |
| **Field Staff** | Assigned Missions | POD | Mission Status | None | None | None | No |

*Note: Roles and permissions are 100% DB-driven via `Role`, `Permission`, `RolePermission`, and `RoleMenu` tables.*
