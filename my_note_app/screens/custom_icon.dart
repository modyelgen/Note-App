import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key,required this.onPressed,required this.icon}) : super(key: key);
  final void Function()? onPressed;
 final Icon icon;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color:Colors.white.withOpacity(0.1),
      ),
        child: IconButton(onPressed: onPressed, icon:icon));
  }
}
