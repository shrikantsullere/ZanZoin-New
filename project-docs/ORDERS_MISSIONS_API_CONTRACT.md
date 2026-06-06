# ORDERS & MISSIONS API CONTRACT

## 1. Orders API Contract

### `POST /api/v1/orders`
**Description:** Create a new order.
**Headers:**
- `Authorization`: `Bearer <token>`
**Body (JSON Schema):**
```json
{
  "clientId": 1, // Integer, Required
  "priority": "normal", // Enum: ['normal', 'high', 'urgent'], Optional
  "orderType": "Procurement", // String, Optional mapping (handled by controller/prisma)
  "items": [
    {
      "itemId": 5, // Integer, Required
      "warehouseId": 2, // Integer, Required
      "quantity": 10.5, // Float, Required
      "unitPrice": 100.00 // Float, Required
    }
  ]
}
```
**Response (201 Created):** Returns the generated `Order` object with `orderNumber`.

### `PUT /api/v1/orders/:id/status`
**Description:** Update order status.
**Body:**
```json
{
  "status": "approved" // Enum: ['submitted', 'review', 'approved', 'rejected', 'cancelled']
}
```

---

## 2. Missions API Contract

### `POST /api/v1/missions`
**Description:** Assign a dispatch/mission to an employee.
**Headers:**
- `Authorization`: `Bearer <token>`
**Body (JSON Schema):**
```json
{
  "deliveryId": 12, // Integer, Required
  "assignedEmployeeId": 5, // Integer, Required
  "remarks": "Urgent airport pickup" // String, Optional
}
```
**Response (201 Created):** Returns `Mission` object with `missionNumber`.

### `POST /api/v1/missions/:id/pod`
**Description:** Submit Proof of Delivery (POD) for a mission/delivery.
**Body:**
```json
{
  "receiverName": "John Doe", // String, Required
  "receiverPhone": "+1234567890", // String, Optional
  "receiverSignature": "data:image/png;base64,...", // String, Optional
  "deliveryPhoto": "https://storage.xyz/photo.jpg", // String, Optional
  "remarks": "Left at front desk" // String, Optional
}
```
