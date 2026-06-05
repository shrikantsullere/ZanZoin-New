import express from 'express';
import { getTickets, createTicket, updateTicketStatus } from '../controllers/support.controller.js';
import { authenticate } from '../middlewares/auth.middleware.js';

const router = express.Router();

router.use(authenticate);

router.get('/tickets', getTickets);
router.post('/tickets', createTicket);
router.patch('/tickets/:id/status', updateTicketStatus);

export default router;
