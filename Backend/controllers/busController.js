const asyncHandler = require('express-async-handler');
const Bus = require('../models/Bus')


// @desc Get all buses
// @route GET /api/buses
// @access Public

const getBuses = asyncHandler(async (req,res) => {
    const buses = await Bus.find();
    res.json(buses)
})


// @desc Create a new bus
// @route POST /api/buses
// @access Private/admin

const createBus = asyncHandler(async (req,res) => {
    const {busNumber,seats,type} = req.body
    const bus = new Bus({
        busNumber,
        seats,
        type
    });

    const createdBus = await bus.save()
    res.status(201).json(createdBus)
});

// @desc    Get bus by ID
// @route   GET /api/buses/:id
// @access  Public

const getBusById = asyncHandler(async (req,res) => {
    const bus = await Bus.findById(req.params.id);

    if (bus) {
        res.json(bus)
    } else {
        res.status(404);
        throw new Error('Bus not found')
    }
})



// @desc    Update bus
// @route   PUT /api/buses/:id
// @access  Private/Admin
const updateBus = asyncHandler(async (req,res) => {
    const {busNumber,seats,type} = req.body;
    const bus = await Bus.findById(req.params.id);
    if (bus) {
        bus.busNumber = busNumber || bus.busNumber,
        bus.seats = seats || bus.seats,
        bus.type = type || bus.type

        const updatedBus = await bus.save();
        res.json(updatedBus)
    } else {
        res.status(404);
        throw new Error('Bus not found')
    }

})


// @desc    Delete bus
// @route   DELETE /api/buses/:id
// @access  Private/Admin

const deleteBus = asyncHandler(async (req,res) => {
    const bus = await Bus.findById(req.params.id)

    if (bus) {
        await bus.remove();
        res.json({
            message:'Bus removed'
        })
    } else {
        res.status(404);
        throw new Error('Bus not found')
    }
})


module.exports = {
    getBuses,
    getBusById,
    updateBus,
    createBus,
    deleteBus,
}
