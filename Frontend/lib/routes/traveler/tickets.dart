import 'package:finote/routes/traveler/home.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Ticket',
      home: TicketScreen(),
    );
  }
}

class TicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        title: const Text('Ticket'),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32, top: 16, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/walya_bus.png', // Replace with your logo asset
                        height: 50,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('-' * 10),
                        const Text(
                          'Walya Bus',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('-' * 10),

                      ],
                    ),
                    const SizedBox(height: 16.0),
                    TicketDetailRow(label: 'Ticket Number:', value: '12345678'),
                    TicketDetailRow(
                        label: 'Passenger Name:', value: 'Aster Yohannes'),
                    TicketDetailRow(
                        label: 'Departure Location:', value: 'Addis Ababa'),
                    TicketDetailRow(
                        label: 'Arrival Location:', value: 'Bahir Dar'),
                    TicketDetailRow(
                        label: 'Departure Date & Time:',
                        value: 'July 15, 2024, 09:00 AM'),
                    TicketDetailRow(label: 'Bus Number:', value: 'AB1234'),
                    TicketDetailRow(label: 'Seat Number:', value: '7'),
                    TicketDetailRow(label: 'Ticket Price:', value: '700 ETB'),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Bus Policies:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        '• Free cancellations up to 24 hours before departure, partial refund for cancellations between 24 to 48 hours before.\n'
                        '• Each passenger is allowed one carry-on bag and two checked bags. Additional charges for excess or oversized luggage.\n'
                        '• Passengers must check in at least 30 minutes before departure and present a valid ID along with their ticket.',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: QrImageView(data: ' 12345678', size: 200)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.only(left: 48.0, right: 48),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(double.infinity, 50)
              ),
              child: const Text('Download as PDF'),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class TicketDetailRow extends StatelessWidget {
  final String label;
  final String value;

  TicketDetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
