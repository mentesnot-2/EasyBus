// registration page for traveler users that allows them to register using their first name, last name, phone number and and password

import 'package:finote/routes/traveler/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool registerflag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_orange.png',
              height: 100,
            ),
            const SizedBox(height: 50),
            const TextField(
              decoration: InputDecoration(
                labelText: 'First Name',
                // hintText: 'Enter your first name',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Last Name',
                // hintText: 'Enter your last name',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                // hintText: 'Enter your phone number',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                // hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                // hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(double.infinity, 50)),
                onPressed: () {
                  setState(() {
                    registerflag = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Registration Successful'),
                      ),
                    ); 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));  
                  });
                },
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}