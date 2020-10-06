import 'package:flower_detector/styles/gradient.dart';
import 'package:flutter/material.dart';

class HomeFrame extends StatelessWidget {
  const HomeFrame({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: greenGradient,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: child,
        ),
      ),
    );
  }
}
