// Tickets for the search results page

import 'package:finote/routes/traveler/trip_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(
            'Search Results',
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
                      Text('-' * 6),
                      const Icon(Icons.directions_bus_rounded),
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
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TripDetail()));
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // logo, name of the bus company, date, price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/walya_bus.png', width: 64),
                            const Text(
                              'Selam Bus',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const Text('July 16, 2024'),
                        const Text(
                          'ETB 500',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // departure time, duration, arrival time
                        Text('8:00 AM'),
                        Text(
                          '   10 hours',
                          style: TextStyle(fontSize: 11),
                        ),
                        Text('6:00 PM'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // starting point, dashed line, bus icon, dashed line, destination
                        const Text(
                          'Addis Ababa',
                          style: TextStyle(fontSize: 11),
                        ),
                        Text('-' * 16),
                        const Icon(Icons.directions_bus_rounded),
                        Text('-' * 16),
                        const Text(
                          'Bahirdar',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Amenities list: wifi, charging ports, snacks, drinks and available seats
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.wifi,
                              // size: 16,
                            ),
                            Text(
                              'Free Wifi',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.battery_charging_full),
                            Text(
                              'Charging Ports',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.fastfood),
                            Text(
                              'Snacks',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        Text(
                          '20 seats',
                          style: TextStyle(fontSize: 11, color: Colors.orange),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.filter_alt_rounded),
          backgroundColor: Theme.of(context).primaryColor,
        ));
  }
}
