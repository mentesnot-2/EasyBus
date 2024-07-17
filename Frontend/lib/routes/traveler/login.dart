// a visually appealing login page
// that allows the user to login
// using their email and password

import 'package:finote/routes/traveler/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginflag = true;
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
            SizedBox(height: 50),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                // hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
                // hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: Size(double.infinity, 50)),
                onPressed: () {
                  setState(() {
                    loginflag = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login Successful'),
                      ),
                    ); 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));  
                  });
                },
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}
