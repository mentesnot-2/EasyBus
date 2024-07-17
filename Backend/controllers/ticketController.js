const asyncHandler = require('express-async-handler');
const Ticket = require('../models/Ticket');

// @desc    Get all tickets
// @route   GET /api/tickets
// @access  Private/Admin
const getTickets = asyncHandler(async (req, res) => {
  const tickets = await Ticket.find().populate('user', 'name email').populate('bus').populate('route');
  res.json(tickets);
});

// @desc    Create a new ticket
// @route   POST /api/tickets
// @access  Private
const createTicket = asyncHandler(async (req, res) => {
  const { user, bus, route, seatNumber, price, travelDate } = req.body;

  const ticket = new Ticket({
    user,
    bus,
    route,
    seatNumber,
    price,
    travelDate,
  });

  const createdTicket = await ticket.save();
  res.status(201).json(createdTicket);
});

// @desc    Get ticket by ID
// @route   GET /api/tickets/:id
// @access  Private
const getTicketById = asyncHandler(async (req, res) => {
  const ticket = await Ticket.findById(req.params.id).populate('user', 'name email').populate('bus').populate('route');

  if (ticket) {
    res.json(ticket);
  } else {
    res.status(404);
    throw new Error('Ticket not found');
  }
});

// @desc    Update ticket
// @route   PUT /api/tickets/:id
// @access  Private
const updateTicket = asyncHandler(async (req, res) => {
  const { user, bus, route, seatNumber, price, travelDate, status } = req.body;

  const ticket = await Ticket.findById(req.params.id);

  if (ticket) {
    ticket.user = user || ticket.user;
    ticket.bus = bus || ticket.bus;
    ticket.route = route || ticket.route;
    ticket.seatNumber = seatNumber || ticket.seatNumber;
    ticket.price = price || ticket.price;
    ticket.travelDate = travelDate || ticket.travelDate;
    ticket.status = status || ticket.status;

    const updatedTicket = await ticket.save();
    res.json(updatedTicket);
  } else {
    res.status(404);
    throw new Error('Ticket not found');
  }
});

// @desc    Delete ticket
// @route   DELETE /api/tickets/:id
// @access  Private/Admin
const deleteTicket = asyncHandler(async (req, res) => {
  const ticket = await Ticket.findById(req.params.id);

  if (ticket) {
    await ticket.remove();
    res.json({ message: 'Ticket removed' });
  } else {
    res.status(404);
    throw new Error('Ticket not found');
  }
});

module.exports = {
  getTickets,
  createTicket,
  getTicketById,
  updateTicket,
  deleteTicket,
};
