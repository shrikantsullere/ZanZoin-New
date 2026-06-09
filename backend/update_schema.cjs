const fs = require('fs');

const path = 'c:\\kiaan project\\zanzoin-new\\backend\\prisma\\schema.prisma';
let content = fs.readFileSync(path, 'utf8');

const trackingModel = `
model Tracking {
  id        Int      @id @default(autoincrement())
  tenantId  Int
  trackerId String
  asset     String
  location  String
  signal    String   @default("Strong")
  eta       String?
  status    String   @default("Active")
  
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  tenant Tenant @relation(fields: [tenantId], references: [id])

  @@unique([trackerId, tenantId])
  @@index([tenantId])
  @@index([trackerId])
  @@map("tracking")
}
`;

if (!content.includes('model Tracking')) {
  content += trackingModel;
  
  // Add relation to Tenant
  content = content.replace('vehicles       Vehicle[]', 'vehicles       Vehicle[]\n  trackings      Tracking[]');
  
  fs.writeFileSync(path, content);
  console.log('Successfully updated schema.prisma');
} else {
  console.log('Tracking model already exists in schema.prisma');
}
