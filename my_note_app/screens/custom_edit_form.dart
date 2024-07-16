import 'package:flutter/material.dart';

class CustomEditTextFormField extends StatelessWidget {
  const CustomEditTextFormField({Key? key,  this.input,this.maxLine=1, this.onSaved,this.onChanged,}) : super(key: key);
  final String?input;
  final int maxLine;
  final void Function( String?)? onSaved;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: TextEditingController(
        text: input??''
      ),
      decoration: InputDecoration(

          border:buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(Colors.cyan)

      ),
      maxLines:maxLine,
      validator: (value){
        if(value!.isEmpty){
          return 'that field is required cant be empty';
        }
        else {
          return null;
        }
      },
      onSaved:onSaved,
      onChanged: onChanged,

    );
  }
  OutlineInputBorder buildBorder([color]){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        )
    );
  }
}
