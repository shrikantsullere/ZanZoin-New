import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

(async () => {
  try {
    const warehouses = await prisma.warehouse.findMany();
    const items = await prisma.item.findMany();
    console.log("Warehouses:", warehouses.map(w => ({ id: w.id, name: w.name })));
    console.log("Items:", items.map(i => ({ id: i.id, name: i.name })));
  } catch (err) {
    console.error(err);
  } finally {
    await prisma.$disconnect();
  }
})();
