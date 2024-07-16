
import 'package:app_1/my_note_app/note_model.dart';
import 'package:app_1/my_note_app/screens/bottom_end_sheet.dart';
import 'package:app_1/my_note_app/screens/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../cubit/add_cubit/note_cubit.dart';
import '../cubit/add_cubit/note_states.dart';
import 'color_picker/list_color_picker.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);
  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}
class _ModalBottomSheetState extends State<ModalBottomSheet> {
  String? title,subtitle;
 final GlobalKey<FormState>formKey=GlobalKey();
  AutovalidateMode autoValidateMode =AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15,),
            CustomTextFormField(
              hint: 'Title',onSaved: (value){
              title =value;
            },),
            const SizedBox(height: 10,),
            CustomTextFormField(
              hint: 'Subtitle',maxLine: 4,onSaved: (value){
              subtitle =value;
            },),
           const SizedBox(height: 20),
            const ListColorPicker(),
            const SizedBox(height: 20,),
            BlocBuilder<AddNoteCubit,AddNoteStates>(
              builder: (context,state){
                return CustomBottomEnd(
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        var noteModel=NoteModel(title: title!, date:DateFormat.yMEd().format(DateTime.now()), content: subtitle!,color: Colors.red.value);
                        BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                      }
                      else{
                        autoValidateMode=AutovalidateMode.always;
                        setState(() {

                        });
                      }
                    });
              },

            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}


