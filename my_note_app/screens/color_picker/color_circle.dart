import 'package:app_1/constants.dart';
import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({Key? key,required this.isPressed,required this.color}) : super(key: key);
 final bool isPressed;
 final Color color;
  @override
  Widget build(BuildContext context) {
    return isPressed?  CircleAvatar(
      radius: 24,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: color,
      ),
    ): CircleAvatar(
      radius: 24,
      backgroundColor: color,
    );
  }
}
