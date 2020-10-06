import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.source,
  }) : super(key: key);

  final String text;
  final Function(ImageSource source) onTap;
  final ImageSource source;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => onTap(source),
            child: Container(
              width: size.width - 180.0,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 17.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF56AB2F),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
