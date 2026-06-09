import prisma from '../config/db.js';

// Tickets
export const createTicket = async (data) => await prisma.supportTicket.create({ data });
export const findAllTickets = async (tenantId) => await prisma.supportTicket.findMany({ where: { ...(tenantId !== null && { tenantId }) }, orderBy: { createdAt: 'desc' } });
export const findTicketById = async (ticketId, tenantId) => {
  if (tenantId === null) return await prisma.supportTicket.findFirst({ where: { ticketId } });
  return await prisma.supportTicket.findUnique({ where: { ticketId_tenantId: { ticketId, tenantId } } });
};
export const updateTicket = async (ticketId, tenantId, data) => {
  if (tenantId === null) {
    const existing = await prisma.supportTicket.findFirst({ where: { ticketId } });
    if (!existing) return null;
    return await prisma.supportTicket.update({ where: { id: existing.id }, data });
  }
  return await prisma.supportTicket.update({ where: { ticketId_tenantId: { ticketId, tenantId } }, data });
};
export const deleteTicket = async (ticketId, tenantId) => {
  if (tenantId === null) {
    const existing = await prisma.supportTicket.findFirst({ where: { ticketId } });
    if (!existing) return null;
    return await prisma.supportTicket.delete({ where: { id: existing.id } });
  }
  return await prisma.supportTicket.delete({ where: { ticketId_tenantId: { ticketId, tenantId } } });
};

// Events
export const createEvent = async (data) => await prisma.event.create({ data });
export const findAllEvents = async (tenantId) => await prisma.event.findMany({
  where: { ...(tenantId !== null && { tenantId }) },
  include: {
    client: { select: { id: true, name: true, contactName: true } },
    manager: { select: { id: true, name: true } }
  },
  orderBy: { createdAt: 'desc' }
});
export const findEventById = async (eventId, tenantId) => {
  if (tenantId === null) return await prisma.event.findFirst({ where: { eventId } });
  return await prisma.event.findUnique({ where: { eventId_tenantId: { eventId, tenantId } } });
};
export const updateEvent = async (eventId, tenantId, data) => {
  if (tenantId === null) {
    const existing = await prisma.event.findFirst({ where: { eventId } });
    if (!existing) return null;
    return await prisma.event.update({ where: { id: existing.id }, data });
  }
  return await prisma.event.update({ where: { eventId_tenantId: { eventId, tenantId } }, data });
};
export const deleteEvent = async (eventId, tenantId) => {
  if (tenantId === null) {
    const existing = await prisma.event.findFirst({ where: { eventId } });
    if (!existing) return null;
    return await prisma.event.delete({ where: { id: existing.id } });
  }
  return await prisma.event.delete({ where: { eventId_tenantId: { eventId, tenantId } } });
};

// Guest Requests
export const createGuestRequest = async (data) => await prisma.guestRequest.create({ data });
export const findAllGuestRequests = async (tenantId) => await prisma.guestRequest.findMany({ where: { ...(tenantId !== null && { tenantId }) }, orderBy: { createdAt: 'desc' } });
export const findGuestRequestById = async (requestId, tenantId) => {
  if (tenantId === null) return await prisma.guestRequest.findFirst({ where: { requestId } });
  return await prisma.guestRequest.findUnique({ where: { requestId_tenantId: { requestId, tenantId } } });
};
export const updateGuestRequest = async (requestId, tenantId, data) => {
  if (tenantId === null) {
    const existing = await prisma.guestRequest.findFirst({ where: { requestId } });
    if (!existing) return null;
    return await prisma.guestRequest.update({ where: { id: existing.id }, data });
  }
  return await prisma.guestRequest.update({ where: { requestId_tenantId: { requestId, tenantId } }, data });
};
export const deleteGuestRequest = async (requestId, tenantId) => {
  if (tenantId === null) {
    const existing = await prisma.guestRequest.findFirst({ where: { requestId } });
    if (!existing) return null;
    return await prisma.guestRequest.delete({ where: { id: existing.id } });
  }
  return await prisma.guestRequest.delete({ where: { requestId_tenantId: { requestId, tenantId } } });
};
