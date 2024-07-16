import 'package:app_1/my_note_app/cubit/read_cubit/cubit.dart';
import 'package:app_1/my_note_app/cubit/read_cubit/states.dart';
import 'package:app_1/my_note_app/note_model.dart';
import 'package:app_1/my_note_app/screens/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<ReadNoteCubit,ReadNoteStates>(
      builder: (context,state){
        List<NoteModel>notes=BlocProvider.of<ReadNoteCubit>(context).notes??[];
        return ListView.separated(
          itemBuilder: (context,index)=>  NoteItem(noteModel: notes[index],),
          itemCount: notes.length,
          separatorBuilder: (context,index)=>const SizedBox(
            height: 15,
          ),
          physics:const BouncingScrollPhysics(),
        );
      },
    );
  }
}
