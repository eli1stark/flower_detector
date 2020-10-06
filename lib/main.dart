import 'package:flutter/material.dart';
import 'screens/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flower Detector',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SplashPage(),
    );
  }
}
