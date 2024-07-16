import 'package:app_1/my_note_app/cubit/read_cubit/cubit.dart';
import 'package:app_1/my_note_app/screens/custom_app_bar.dart';
import 'package:app_1/my_note_app/screens/list_note_item.dart';
import 'package:app_1/my_note_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteBody extends StatefulWidget {
  const NoteBody({Key? key}) : super(key: key);

  @override
  State<NoteBody> createState() => _NoteBodyState();
}


class _NoteBodyState extends State<NoteBody> {
  @override
  void initState() {
    BlocProvider.of<ReadNoteCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 40,),
         CustomAppBar(title: 'Notes', onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return  SearchScreen(notesList: BlocProvider.of<ReadNoteCubit>(context).notes!.toList(),);
           }));
         }, icon: const Icon(Icons.search,size: 35,)),
         const SizedBox(height: 10,),
          const Expanded(child:  NoteList())
        ],
      ),
    );
  }
}
