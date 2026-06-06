# 08 NOTIFICATION ENGINE

## Current State
- The database contains a `Notification` table (`id`, `title`, `message`, `type`, `userId`, `isRead`, `createdAt`).
- UI polling or context loading fetches these.

## Required Implementation Architecture
A true enterprise notification engine must decouple event generation from event delivery.

### 1. Trigger Events
- `Order Created` -> Notify Operations (Role-based broadcast)
- `Mission Assigned` -> Notify specific Field Staff (Direct user broadcast)
- `Mission Completed` -> Notify Client & Operations
- `PO Generated` -> Notify Vendor (Email) & Procurement Lead (In-App)
- `Stock Low` -> Notify Inventory Manager

### 2. Delivery Channels
- **In-App**: Via WebSockets / Server-Sent Events (SSE) for instant dashboard updates.
- **Push**: Via FCM (Firebase Cloud Messaging) for Field Staff mobile interfaces.
- **Email**: Via SMTP / SendGrid for Vendors, Clients, and PDF document deliveries.
- **SMS**: For urgent Chauffeur ETA updates to Concierge clients.

### 3. Missing Infrastructure
- No Event Bus (like RabbitMQ or Redis PubSub) exists to handle asynchronous notification dispatching without blocking the main API thread.
- Currently, logic is hardcoded inside controllers.
