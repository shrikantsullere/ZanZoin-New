# PHASE 1 SCHEMA JUSTIFICATION

Based on the strict review of the actual client chat history and the foundational rule to **reuse existing architecture whenever possible**, here is the validation of the proposed new tables.

---

## 1. Vehicle Table

**1. Exact client requirement reference:** 
> *"some field staff only need to do order deliveries, some field staff only need to do logistics missions, some field staff only need to do chauffeur missions. But 1 field staff cannot be allowed to do all of these if they don’t have the appropriate vehicle... we will need them to upload a photo of their car, their license, their registration, vehicle plate and proof of insurance before deciding"*

**2. Why existing tables cannot support this flow:**
Currently, the `Employee` model lacks fields to store vehicle properties. However, `EmployeeDocument` already exists to store files.

**3. Whether a new table is truly required:**
**NO.**

**4. Alternative approach using existing schema:**
Instead of a separate `Vehicle` table, add `vehicleType` and `vehiclePlate` fields directly to the existing `Employee` table. The photos of the car, license, and insurance can simply be saved as records in the existing `EmployeeDocument` table with `documentType` set to `"vehicle_photo"`, `"license"`, etc.

**5. Migration risk level:** Low (Simply adding string columns to `Employee`).
**6. Impacted APIs:** `/api/v1/employees`.
**7. Impacted UI:** Field Staff registration UI, Mission Assignment filtering.
**8. Impacted roles:** Field Staff (uploading), Admin (reviewing).

---

## 2. StaffApplication Table

**1. Exact client requirement reference:**
> *"will there be an option for people to sign up to become field staff? Then it put them on a wait list to be accepted? If this option is already available... we will need them to upload a photo..."*

**2. Why existing tables cannot support this flow:**
The backend currently assumes created users are active immediately, though the `status` field exists.

**3. Whether a new table is truly required:**
**NO.**

**4. Alternative approach using existing schema:**
Use the existing `User` and `Employee` tables. When a field staff registers, insert a `User` record with `roleId` mapped to `FIELD_STAFF` and `status` explicitly set to `"PENDING"`. Admins query `Users` where `status = "PENDING"`. Upon verifying their `EmployeeDocuments`, the admin changes `status` to `"ACTIVE"`.

**5. Migration risk level:** Zero (Requires no DB schema changes, only API logic updates).
**6. Impacted APIs:** `/api/v1/auth/register-staff`, `/api/v1/employees/approve`.
**7. Impacted UI:** Admin Staff Approval list.
**8. Impacted roles:** Admin, Super Admin.

---

## 3. ChauffeurRide Table

**1. Exact client requirement reference:**
> *"Chauffeur- How many passengers in chauffeur. Concierge/Super Admin & Client need the ability to cancel or edit chauffeur... Also, how does client track chauffeur information in their portal"*

**2. Why existing tables cannot support this flow:**
Currently, Field Staff assignments live in the `Mission` table. But `Mission` is strictly bound to `deliveryId`, which requires physical products. Chauffeurs move people, not products.

**3. Whether a new table is truly required:**
**NO.**

**4. Alternative approach using existing schema:**
We can heavily reuse the `Order` and `Mission` tables.
- **Modification**: Add `orderType` to the `Order` table (`"PRODUCT"`, `"CHAUFFEUR"`, `"LOGISTICS"`).
- **Modification**: Make `deliveryId` in the `Mission` table **optional** (`Int?`), and add `orderId` as a direct link.
- **Modification**: Add a `metadata` JSON field to `Order` and `Mission` to store dynamic chauffeur details (e.g., `{"passengers": 4, "pickupTime": "..."}`). 
This completely handles tracking, editing, and assigning without building a redundant parallel table structure.

**5. Migration risk level:** Medium (Requires modifying `Mission` constraints to allow nullable `deliveryId`).
**6. Impacted APIs:** `/api/v1/orders`, `/api/v1/missions`.
**7. Impacted UI:** Chauffeur booking screen, Client tracking screen.
**8. Impacted roles:** Client, Concierge, Chauffeur (Field Staff).

---

## 4. ConciergeRequest Table

**1. Exact client requirement reference:**
> *"Concierge/Super Admin & Client need the ability to cancel or edit chauffeur"* (Concierge acts as an agent for the client).

**2. Why existing tables cannot support this flow:**
Concierge requests are essentially custom client requests.

**3. Whether a new table is truly required:**
**NO.**

**4. Alternative approach using existing schema:**
Similar to Chauffeur rides, reuse the `Order` table. Add `"CONCIERGE"` as an `orderType`. The Concierge role simply views and edits `Orders` where `orderType = "CONCIERGE"`.

**5. Migration risk level:** Low (relies on the same modifications as Chauffeur).
**6. Impacted APIs:** `/api/v1/orders`.
**7. Impacted UI:** Concierge Dashboard.
**8. Impacted roles:** Concierge.

---

### CONCLUSION
**None of the 4 proposed tables are necessary.** The exact client requirements can be fulfilled entirely by modifying existing tables (adding `metadata` JSON, `type` enums, and relaxing constraints). This heavily reduces system bloat and keeps the workflow unified.
