# 07 MODULE DEPENDENCIES

## Module Coupling

### Admin Core
**Depends on**: Auth
**Depended on by**: ALL Modules. (Users, Employees, Departments drive all assignments).

### Client Ordering
**Depends on**: Admin Core (Users)
**Depended on by**: Operations (To review orders), Finance (To bill orders).

### Procurement
**Depends on**: Admin Core (Departments/Employees), Vendor Management.
**Depended on by**: Inventory (Needs POs to create GRNs).

### Inventory
**Depends on**: Admin Core (Warehouses), Procurement (GRNs).
**Depended on by**: Logistics/Operations (Needs stock to fulfill Orders).

### Operations & Logistics
**Depends on**: Client Ordering (What to deliver), Inventory (What to pull from), Admin Core (Who to assign).
**Depended on by**: Finance (Completion triggers invoicing), Field Staff (Receives instructions).

### Field Staff Application
**Depends on**: Logistics (Missions).
**Depended on by**: Client (For live tracking and POD confirmation).

### Finance
**Depends on**: ALL execution modules (Orders, Deliveries, Subscriptions).
**Depended on by**: Reporting.
