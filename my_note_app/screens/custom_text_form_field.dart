import 'package:app_1/my_note_app/note_model.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, this.hint,this.maxLine=1, this.onSaved,this.onChanged,this.input,this.border=16}) : super(key: key);
  final String?hint;
  final int maxLine;
  final double border;
  final void Function( String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? input;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(

      controller: TextEditingController(
        text: input??'',
      ),
      decoration: InputDecoration(
        hintText:hint,
        hintStyle: const TextStyle(color: Colors.cyan,),
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
        borderRadius: BorderRadius.circular(border),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        )
    );
  }
}
