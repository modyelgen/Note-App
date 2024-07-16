import 'package:app_1/my_note_app/screens/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key,required this.title,required this.onPressed,required this.icon}) : super(key: key);
final String title;
final void Function()?onPressed;
final Icon icon;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(title,style: const TextStyle(fontSize: 24),),
        const Spacer(),
        CustomIcon(onPressed: onPressed, icon: icon),
      ],
    );
  }
}
