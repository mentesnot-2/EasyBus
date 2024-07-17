const mongoose = require('mongoose');

const routeSchema = new mongoose.Schema({
  startLocation: {
    type: String,
    required: true,
  },
  endLocation: {
    type: String,
    required: true,
  },
  distance: {
    type: Number,
    required: true,
  },
  duration: {
    type: String,
    required: true,
  },
  stops: [{
    location: String,
    time: String,
  }],
  buses: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Bus',
  }],
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

module.exports = mongoose.model('Route', routeSchema);
