const express = require('express');
const dotenv = require("dotenv");
const connectDB = require('./config/db')


dotenv.config({path:'./env'});

connectDB();
const app = express();
app.use(express.json())


// Routes
app.use('/api/auth',require('./routes/authRoutes'))
app.use('/api/buses',require('./routes/busRoutes'));
app.use('/api/payments',require('./routes/paymentRoutes'))
app.use('/api/routes',require('./routes/routeRoutes'));
app.use('/api/tickets',require('./routes/ticketRoutes'))