import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

prisma.guestRequest.findMany().then(res => {
  console.log(JSON.stringify(res, null, 2));
}).finally(() => prisma.$disconnect());
