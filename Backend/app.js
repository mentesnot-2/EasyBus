const express = require('express');
const dotenv = require('dotenv');
const connectDB = require('./config/db');

dotenv.config({ path: './.env' });

connectDB();

const app = express();

app.use(express.json());

// Routes
app.use('/api/auth', require('./routes/authRoutes'));
// app.use('/api/buses', require('./routes/busRoutes'));
// app.use('/api/payments', require('./routes/paymentRoutes'));
// app.use('/api/routes', require('./routes/routeRoutes'));
// app.use('/api/tickets', require('./routes/ticketRoutes'));

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Internal Server Error');
});

const PORT = process.env.PORT || 5000; // Choose a port number, here defaulting to 5000

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

module.exports = app;
