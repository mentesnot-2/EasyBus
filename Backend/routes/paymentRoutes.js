const paymentController = require('../controllers/paymentController');
const express = require('express');
const router = express.Router();


router.get('/getPayment', paymentController.getPayments);
router.post('/addPayment', paymentController.createPayment);
router.get('/getPayment/:id', paymentController.getPaymentById);



module.exports = router;
