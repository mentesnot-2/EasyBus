const busController = require("../controllers/busController");
const express = require("express");
const router = express.Router();

router.get("/getBus", busController.getBuses);
router.post("/addBus", busController.createBus);
router.put("/updateBus/:id", busController.updateBus);
router.delete("deleteBus/:id", busController.deleteBus);


module.exports = router;