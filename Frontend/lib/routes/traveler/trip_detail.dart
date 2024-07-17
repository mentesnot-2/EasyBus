import 'package:finote/routes/traveler/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TripDetail extends StatelessWidget {
  const TripDetail({super.key});

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
                    CircleAvatar(backgroundImage: AssetImage('assets/images/walya_bus.png')),
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
                'Trip Information:',
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
                    Text('Bus Operator: Selam Bus'),
                  SizedBox(height: 8),

                    Text('Departure Time: 8:00 AM'),
                  SizedBox(height: 8),

                    Text('Arrival Time: 4:00 PM'),
                  SizedBox(height: 8),

                    Text('Duration: 8 hours'),
                  ],
                ),
              ),
            ),
            // Available Amenities
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Available Amenities:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.wifi),
                        SizedBox(
                          width: 8,
                        ),
                        Text('WiFi'),
                      ],
                    ),
                  SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(Icons.power),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Power Outlets'),
                      ],
                    ),
                  SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(Icons.airline_seat_recline_normal),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Reclining Seats'),
                      ],
                    ),
                  SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(Icons.ac_unit),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Air Conditioning'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Bus Policies: this is a 3 bullet point list of policies that the bus company has
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Bus Policies:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.cancel),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          'Free cancellation up to 24 hours before departure; partial refund for cancellations between 24 and 12 hours prior.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            // color: Colors.grey[200],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.luggage),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          'Each passenger is allowed one carry-on bag and two checked bags, with additional charges for excess or overweight luggage.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            // color: Colors.grey[200]
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          'Passengers must check in at least 30 minutes before departure and present a valid ID along with their ticket.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            // color: Colors.grey[200]
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Ticket Price
            const Center(
              child: Text(
                'Ticket Price: 600 ETB',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
            ),
            const SizedBox(height: 8),
            // Book Now button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    fixedSize: const Size(double.infinity, 50)),
                child: const Text('Book Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
