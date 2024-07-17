// A page for collecting info about each traveller
import 'package:flutter/material.dart';

class PassengersInfo extends StatelessWidget {
  const PassengersInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Passengers Info',
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
          PassengerInfoForm(
            passengerNumber: 1,
          ),
          PassengerInfoForm(
            passengerNumber: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly  ,
              children: [
                SizedBox(
                  width: 70,
                ),

                TextButton(
                  onPressed: () {},
                  child: Text('Cancel', style: TextStyle(color: Colors.red),),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    fixedSize: Size(double.infinity, 50),
                  ),
                ),
                SizedBox(width: 70,),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    fixedSize: Size(double.infinity, 50),
                  ),
                  child: Text('Continue'),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PassengerInfoForm extends StatefulWidget {
  final int passengerNumber;
  const PassengerInfoForm({super.key, required this.passengerNumber});

  @override
  State<PassengerInfoForm> createState() => _PassengerInfoFormState();
}

class _PassengerInfoFormState extends State<PassengerInfoForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'Passenger :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                labelText: 'Full Name',
              ),
            ),
          ),
          // const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                labelText: 'Phone Number',
              ),
            ),
          ),
          // const SizedBox(height: 8),
          // Drop down list of boarding points
          Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                labelText: 'Boarding Point',
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Autobus Tera',
                  child: Text('Autobus Tera'),
                ),
                DropdownMenuItem(
                  value: 'Addisu Gebeya',
                  child: Text('Addisu Gebeya'),
                ),
                DropdownMenuItem(
                  value: 'Lamberet',
                  child: Text('Lamberet'),
                ),
                DropdownMenuItem(
                  value: 'Meskel Square',
                  child: Text('Meskel Square'),
                ),
              ],
              onChanged: (value) {
                print(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                labelText: 'Deboarding Point',
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Autobus Tera',
                  child: Text('Autobus Tera'),
                ),
                DropdownMenuItem(
                  value: 'Addisu Gebeya',
                  child: Text('Addisu Gebeya'),
                ),
                DropdownMenuItem(
                  value: 'Lamberet',
                  child: Text('Lamberet'),
                ),
                DropdownMenuItem(
                  value: 'Meskel Square',
                  child: Text('Meskel Square'),
                ),
              ],
              onChanged: (value) {
                print(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
