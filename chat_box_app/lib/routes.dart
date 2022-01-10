import 'package:chat_box_app/screens/register_screen.dart';
import 'package:chat_box_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'screens/chat_screen.dart';


class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/chatscreen',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/register': (context) => Register(),
        '/chatscreen': (context) => ChatScreen(),
      },
    );
  }
}