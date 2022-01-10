import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xFF15171A),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Welcome to GMSG",
                  style: TextStyle(
                      color: Color(0xFF0CC2C2),
                      fontWeight: FontWeight.w300,
                      fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}