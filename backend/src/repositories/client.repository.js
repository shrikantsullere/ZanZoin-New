import prisma from '../config/db.js';

// --- Client Methods ---

export const createClient = async (data) => {
  return await prisma.client.create({ data });
};

export const findClientById = async (id) => {
  return await prisma.client.findUnique({
    where: { id },
    include: { contacts: true }
  });
};

export const findClientByCode = async (clientCode, tenantId) => {
  return await prisma.client.findFirst({
    where: { clientCode, tenantId }
  });
};

export const findAllClients = async (tenantId, query) => {
  const { page = 1, limit = 10, search = '', status } = query;
  const skip = (page - 1) * limit;

  const where = {
    ...(tenantId !== null && { tenantId }),
    ...(search && {
      OR: [
        { companyName: { contains: search } },
        { clientCode: { contains: search } },
        { email: { contains: search } }
      ]
    }),
    ...(status && { status })
  };

  const [clients, total] = await Promise.all([
    prisma.client.findMany({
      where,
      skip: Number(skip),
      take: Number(limit),
      orderBy: { createdAt: 'desc' }
    }),
    prisma.client.count({ where })
  ]);

  return { clients, total, page: Number(page), totalPages: Math.ceil(total / limit) };
};

export const updateClient = async (id, data) => {
  return await prisma.client.update({
    where: { id },
    data
  });
};

export const deleteClient = async (id) => {
  return await prisma.client.delete({ where: { id } });
};

// --- Client Contact Methods ---

export const createClientContact = async (clientId, data, tenantId) => {
  if (data.isPrimary) {
    // Reset other primary contacts for this client
    await prisma.clientContact.updateMany({
      where: { clientId, tenantId },
      data: { isPrimary: false }
    });
  }
  return await prisma.clientContact.create({
    data: { ...data, clientId, tenantId }
  });
};

export const deleteClientContact = async (id) => {
  return await prisma.clientContact.delete({ where: { id } });
};
