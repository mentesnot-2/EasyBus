const mongoose = require('mongoose');

const busSchema = new mongoose.Schema({
  busNumber: {
    type: String,
    required: true,
    unique: true,
  },
  seats: {
    type: Number,
    required: true,
  },
  type: {
    type: String,
    enum: ['economy', 'business', 'VIP'],
    default: 'economy',
  },
  routes: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Route',
  }],
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

module.exports = mongoose.model('Bus', busSchema);
