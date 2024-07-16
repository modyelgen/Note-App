import 'package:flutter/material.dart';

class CustomBottomEnd extends StatelessWidget {
  const CustomBottomEnd({Key? key,required this.onTap}) : super(key: key);
final void Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
         color: Colors.cyan,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(child:  Text('Add',style: TextStyle(fontSize: 20,),)),
      ),
    );
  }
}
