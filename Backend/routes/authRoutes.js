const express = require('express');
const authControllers = require('../controllers/authController');
const authRoutes = express.Router();

// @desc    Register new user
// @route   POST /api/auth/register
// @access  Public
authRoutes.post('/register', authControllers.registerUser);

// @desc    Authenticate user & get token
// @route   POST /api/auth/login
// @access  Public
authRoutes.post('/login', authControllers.authUser);

module.exports = authRoutes;
