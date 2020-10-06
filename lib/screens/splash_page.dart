import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import '../styles/gradient.dart';
import 'home.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      title: Text(
        'Flower Detector',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.white,
        ),
      ),
      image: Image.asset('assets/flower.png'),
      gradientBackground: greenGradient,
      photoSize: 100.0,
      loaderColor: Colors.white,
      navigateAfterSeconds: Home(),
    );
  }
}
