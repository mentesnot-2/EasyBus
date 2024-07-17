import 'dart:math';

import 'package:finote/widgets/seat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatSelection extends StatelessWidget {
  const SeatSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Seat Selection',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
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
                    CircleAvatar(
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
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                labelText: 'Number of tickets',
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Seat(
                        backgroundColor: Colors.white,
                      ),
                      Text('Available')
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Seat(
                        backgroundColor: Colors.lightBlue,
                      ),
                      Text('Selected')
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Seat(
                        backgroundColor: Colors.red,
                      ),
                      Text('Reserved')
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        CupertinoIcons.circle,
                        size: 64,
                      ),
                      Icon(
                        Icons.exit_to_app,
                        size: 64,
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SeatColumn(offset: 1,),
                      Seat(
                        backgroundColor: Colors.white,
                        number: 53,
                      ),
                      SeatColumn(offset: 3,),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50),

            child: const Text(
              'Selected Seats: 7, 8',
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50),
            child: const Text(
              'Total Price: 1200 ETB',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    )),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 50),
                    ),
                    onPressed: () {},
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class SeatColumn extends StatelessWidget {
  final int offset;
  const SeatColumn({super.key, required this.offset});

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.red, Colors.white];
    final random = Random();
    final seats1 = List.generate(15, (index) {
      return Seat(
        backgroundColor: colors[random.nextInt(2)],
        number: 4 * index + offset,
      );
    });
final seats2 = List.generate(15, (index) {
      return Seat(
        backgroundColor: colors[random.nextInt(2)],
        number: 4 * index + offset + 1 ,
      );
    });
    return Row(
      children: [
        Column(children: seats1),
        Column(children: seats2),
      ],
    );
  }
}
