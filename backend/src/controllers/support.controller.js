import { sendResponse } from '../utils/response.js';

// In-memory mock for tickets until Prisma schema is updated
let mockTickets = [
  { id: "T-001", user: "Goldwynn Residences", title: "Urgent inventory discrepancy", priority: "High", status: "Open", date: new Date().toISOString().split('T')[0], category: "Inventory", notes: [], attachments: [] },
  { id: "T-002", user: "SY Azure", title: "Chauffeur pick up delay", priority: "Medium", status: "Closed", date: new Date().toISOString().split('T')[0], category: "Chauffeur", notes: [], attachments: [] }
];

export const getTickets = async (req, res, next) => {
  try {
    sendResponse(res, 200, 'Tickets retrieved successfully', mockTickets);
  } catch (error) {
    next(error);
  }
};

export const createTicket = async (req, res, next) => {
  try {
    const newTicket = {
      id: `T-${Math.floor(100 + Math.random() * 900)}`,
      status: 'Open',
      date: new Date().toISOString().split('T')[0],
      notes: [],
      attachments: [],
      ...req.body
    };
    mockTickets.push(newTicket);
    sendResponse(res, 201, 'Ticket created successfully', newTicket);
  } catch (error) {
    next(error);
  }
};

export const updateTicketStatus = async (req, res, next) => {
  try {
    const { id } = req.params;
    const { status } = req.body;
    
    const ticketIndex = mockTickets.findIndex(t => t.id === id);
    if (ticketIndex === -1) {
      return sendResponse(res, 404, 'Ticket not found');
    }
    
    mockTickets[ticketIndex].status = status;
    sendResponse(res, 200, 'Ticket status updated', mockTickets[ticketIndex]);
  } catch (error) {
    next(error);
  }
};
