import 'package:flutter/material.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Text(
              'Welcome, Gerk',
              style: TextStyle(fontSize: 22.0),
            )
          ),
    );
  }
}