import express from 'express';
import * as missionController from '../controllers/mission.controller.js';
import { validate } from '../middlewares/validate.middleware.js';
import { createMissionSchema, submitPODSchema } from '../validators/mission.validator.js';
import { authenticate, checkPermission } from '../middlewares/auth.middleware.js';

const router = express.Router();

router.use(authenticate);

router.get('/', checkPermission('MISSIONS', 'READ'), missionController.getMissions);
router.get('/:id', checkPermission('MISSIONS', 'READ'), missionController.getMissionById);
router.post('/', checkPermission('MISSIONS', 'MANAGE'), validate(createMissionSchema), missionController.createMission);
router.post('/:id/start', checkPermission('MISSIONS', 'MANAGE'), missionController.startMission);
router.post('/:id/pod', checkPermission('MISSIONS', 'COMPLETE'), validate(submitPODSchema), missionController.submitPOD);

export default router;
