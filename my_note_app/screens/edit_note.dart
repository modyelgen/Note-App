import 'package:app_1/my_note_app/cubit/read_cubit/cubit.dart';
import 'package:app_1/my_note_app/note_model.dart';
import 'package:app_1/my_note_app/screens/color_picker/edit_color_picker.dart';
import 'package:app_1/my_note_app/screens/custom_app_bar.dart';
import 'package:app_1/my_note_app/screens/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({Key? key,required this.noteModel}) : super(key: key);
final NoteModel noteModel;
  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title,subtitle;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           const SizedBox(
              height: 40,
            ),
            CustomAppBar(title: 'Edit Note', onPressed: (){
              widget.noteModel.title=title??widget.noteModel.title;
              widget.noteModel.content=subtitle??widget.noteModel.content;
              widget.noteModel.save();
              BlocProvider.of<ReadNoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            }, icon:const Icon(Icons.done,size: 25,)),
           const SizedBox(
              height: 20,
            ),

            CustomTextFormField(input: widget.noteModel.title,onChanged: (value){
              title=value;
            },),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(input: widget.noteModel.content,maxLine: 4,onChanged: (value){
              subtitle=value;
            },),
            const SizedBox(
              height: 15,
            ),
            ListEditColorPicker(noteModel:widget.noteModel,),

          ],
        ),
      ),
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
