import 'dart:io';
import 'package:flutter/material.dart';

class OutputImage extends StatelessWidget {
  const OutputImage({
    Key key,
    @required File image,
  })  : _image = image,
        super(key: key);

  final File _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        child: Image.file(_image),
      ),
    );
  }
}
