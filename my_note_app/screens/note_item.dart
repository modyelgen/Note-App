import 'package:app_1/my_note_app/cubit/read_cubit/cubit.dart';
import 'package:app_1/my_note_app/note_model.dart';
import 'package:app_1/my_note_app/screens/custom_icon.dart';
import 'package:app_1/my_note_app/screens/edit_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key,required this.noteModel}) : super(key: key);
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=> EditNoteView(noteModel: noteModel,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: ListTile(
                title:  Text(noteModel.title,style: const TextStyle(fontSize: 26.0,fontWeight: FontWeight.bold),),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top:8.0,bottom: 50),
                  child: Text(noteModel.content,style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 18,
                  ),),
                ),
                trailing: CustomIcon(onPressed: (){
                  noteModel.delete();
                  BlocProvider.of<ReadNoteCubit>(context).fetchAllNotes();
                }, icon: const Icon(Icons.delete,size: 28,color: Colors.black,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(noteModel.date,style: TextStyle(color: Colors.black.withOpacity(0.4)),),
            ),
            const SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}
