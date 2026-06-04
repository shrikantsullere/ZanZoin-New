const express = require('express');
const router = express.Router();
const clientController = require('../controllers/clientController');
const { protect, authorize } = require('../middlewares/authMiddleware');

// Protect all routes below
router.use(protect);

router
  .route('/')
  .get(clientController.getClients)
  .post(authorize('SUPERADMIN', 'ADMIN'), clientController.createClient);

router
  .route('/:id')
  .get(clientController.getClientById)
  .put(authorize('SUPERADMIN', 'ADMIN'), clientController.updateClient)
  .delete(authorize('SUPERADMIN'), clientController.deleteClient);

module.exports = router;
