import 'package:finote/routes/traveler/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool paymentflag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Trip Detail',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Addis Ababa',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text('-' * 4),
                    const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/walya_bus.png')),
                    Text('-' * 6),
                    const Text(
                      'Bahirdar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'July 16, 2024',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Trip information: bus operator, departure time, arrival time, duration

            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Trip Details:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Route: Addis Ababa -> Bahir Dar'),
                    SizedBox(height: 8),
                    Text('Date and Time: July 12, 2024, 8:00 AM'),
                    SizedBox(height: 8),
                    Text('Bus Operator: Walya Bus'),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Passenger Details:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Abebe Kebede, Seat 7, boarding at Lamberet'),
                    SizedBox(height: 8),
                    Text('Aster Yohannes, Seat 8, boarding at Atobus Tera'),
                  ],
                ),
              ),
            ),

            // Ticket Price
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Ticket Price: 600 ETB',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue),
                ),
              ),
            ),

            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  labelText: 'Payment Method',
                ),
                items: [
                  DropdownMenuItem(
                    value: 'Mobile Money',
                    child: const Text('Mobile Money'),
                    onTap: () => setState(() {
                      paymentflag = true;
                    }),
                  ),
                  DropdownMenuItem(
                    value: 'Credit Card',
                    child: const Text('Credit Card'),
                    onTap: () => setState(() {
                      paymentflag = false;
                    }),
                  ),
                ],
                onChanged: (value) {
                  debugPrint(value);
                },
              ),
            ),
            // Payment info form based on the selected payment method
            const SizedBox(height: 8),
            if (paymentflag)
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
            if (paymentflag) const SizedBox(height: 8),
            if (paymentflag)
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'PIN',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 8),

            // Credit Card payment form
            if (!paymentflag)
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Card Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
            if (!paymentflag) const SizedBox(height: 8),
            if (!paymentflag)
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Expiry Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
            if (!paymentflag) const SizedBox(height: 8),
            if (!paymentflag)
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'CVV',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: const TextStyle(color: Colors.red),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(8),
                      fixedSize: const Size(double.infinity, 50),
                    ),
                  ),
                  
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Icon(Icons.check_circle,
                                  color: Theme.of(context).primaryColor, size: 50),
                              content: const Text(
                                  'Your payment was successful. Enjoy your trip!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                                          Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 TicketScreen()));

                                  },
                                  child: const Text('See Tickets'),
                                )
                              ],
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(8),
                      fixedSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Pay and Finish'),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
