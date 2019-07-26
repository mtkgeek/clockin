import 'package:flutter/material.dart';
import 'package:testflutter/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clockin',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

