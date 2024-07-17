const asyncHandler = require('express-async-handler');
const Payment = require('../models/Payment');

// @desc    Get all payments
// @route   GET /api/payments
// @access  Private/Admin
const getPayments = asyncHandler(async (req, res) => {
  const payments = await Payment.find();
  res.json(payments);
});

// @desc    Create a new payment
// @route   POST /api/payments
// @access  Private
const createPayment = asyncHandler(async (req, res) => {
  const { ticket, amount, paymentMethod } = req.body;

  const payment = new Payment({
    ticket,
    amount,
    paymentMethod,
  });

  const createdPayment = await payment.save();
  res.status(201).json(createdPayment);
});

// @desc    Get payment by ID
// @route   GET /api/payments/:id
// @access  Private
const getPaymentById = asyncHandler(async (req, res) => {
  const payment = await Payment.findById(req.params.id);

  if (payment) {
    res.json(payment);
  } else {
    res.status(404);
    throw new Error('Payment not found');
  }
});

module.exports = {
  getPayments,
  createPayment,
  getPaymentById,
};
