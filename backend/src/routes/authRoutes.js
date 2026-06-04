const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');
const { protect } = require('../middlewares/authMiddleware');

// @route   POST /api/v1/auth/register
// @desc    Register a user
router.post('/register', authController.register);

// @route   POST /api/v1/auth/login
// @desc    Login user & get token
router.post('/login', authController.login);

// @route   GET /api/v1/auth/me
// @desc    Get current logged in user
router.get('/me', protect, authController.getMe);

module.exports = router;
