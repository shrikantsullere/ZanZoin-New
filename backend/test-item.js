import jwt from 'jsonwebtoken';
import { PrismaClient } from '@prisma/client';
import dotenv from 'dotenv';
dotenv.config();

const prisma = new PrismaClient();

(async () => {
  // Find a business client
  const user = await prisma.user.findFirst({ where: { role: { name: 'BUSINESS_CLIENT' } }, include: { role: true } });
  console.log('Testing with User:', user.email, 'Role:', user.role.name);
  
  const token = jwt.sign(
    { id: user.id, email: user.email, roleId: user.roleId },
    process.env.JWT_SECRET || 'ZANEZION_SECURE_TOKEN_SECRET_9921',
    { expiresIn: '24h' }
  );

  const res1 = await fetch('http://localhost:8000/api/v1/items', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
    body: JSON.stringify({
      name: "Test Marketplace Item", 
      categoryId: 1, 
      unitId: 1, 
      description: "Testing Customer Item Bypass", 
      inventoryType: "MARKETPLACE", 
      price: 150, 
      qty: 10, 
      warehouseId: 3
    })
  });
  console.log('CREATE ITEM:', res1.status, await res1.text());

  const res2 = await fetch('http://localhost:8000/api/v1/items', {
    headers: { Authorization: `Bearer ${token}` }
  });
  console.log('FETCH ITEMS:', res2.status, (await res2.json()).data.items.length, 'items');

  process.exit(0);
})();
