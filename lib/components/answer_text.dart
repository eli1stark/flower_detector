import 'package:flutter/material.dart';

class AnswerText extends StatelessWidget {
  AnswerText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
    );
  }
}
