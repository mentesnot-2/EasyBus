const asyncHandler = require('express-async-handler');
const Route = require('../models/Route');

// @desc    Get all routes
// @route   GET /api/routes
// @access  Public
const getRoutes = asyncHandler(async (req, res) => {
  const routes = await Route.find();
  res.json(routes);
});

// @desc    Create a new route
// @route   POST /api/routes
// @access  Private/Admin
const createRoute = asyncHandler(async (req, res) => {
  const { startLocation, endLocation, distance, duration, stops } = req.body;

  const route = new Route({
    startLocation,
    endLocation,
    distance,
    duration,
    stops,
  });

  const createdRoute = await route.save();
  res.status(201).json(createdRoute);
});

// @desc    Get route by ID
// @route   GET /api/routes/:id
// @access  Public
const getRouteById = asyncHandler(async (req, res) => {
  const route = await Route.findById(req.params.id);

  if (route) {
    res.json(route);
  } else {
    res.status(404);
    throw new Error('Route not found');
  }
});

// @desc    Update route
// @route   PUT /api/routes/:id
// @access  Private/Admin
const updateRoute = asyncHandler(async (req, res) => {
  const { startLocation, endLocation, distance, duration, stops } = req.body;

  const route = await Route.findById(req.params.id);

  if (route) {
    route.startLocation = startLocation || route.startLocation;
    route.endLocation = endLocation || route.endLocation;
    route.distance = distance || route.distance;
    route.duration = duration || route.duration;
    route.stops = stops || route.stops;

    const updatedRoute = await route.save();
    res.json(updatedRoute);
  } else {
    res.status(404);
    throw new Error('Route not found');
  }
});

// @desc    Delete route
// @route   DELETE /api/routes/:id
// @access  Private/Admin
const deleteRoute = asyncHandler(async (req, res) => {
  const route = await Route.findById (req.params.id);
  if (route) {
    await route.remove();
    res.json({
        message:'Route Removed'
    })
  } else {
    res.status(404);
    throw new Error('Route not found')
  }
});


module.exports = {
    deleteRoute,
    createRoute,
    updateRoute,
    createRoute,
    getRoutes
}
