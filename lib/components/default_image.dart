import 'package:flower_detector/styles/spacers.dart';
import 'package:flutter/material.dart';

class DefaultImage extends StatelessWidget {
  const DefaultImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: Column(
        children: [
          Image.asset(
            'assets/flower.png',
          ),
          SpaceH30(),
        ],
      ),
    );
  }
}
