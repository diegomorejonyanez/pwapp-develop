import 'package:flutter/material.dart';
import 'package:pretty_app/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
          hintColor: Colors.black,
          focusColor: Colors.black,
          cardColor: Colors.black,
          primaryColor: Colors.black),
    );
  }
}
