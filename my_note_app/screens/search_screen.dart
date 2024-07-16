import 'package:app_1/my_note_app/cubit/read_cubit/cubit.dart';
import 'package:app_1/my_note_app/note_model.dart';
import 'package:app_1/my_note_app/screens/edit_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key,required this.notesList}) : super(key: key);
  final List <NoteModel> notesList;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    BlocProvider.of<ReadNoteCubit>(context).fetchAllNotes();
    super.initState();
  }
  String ?querySearch=' ';
  @override
  Widget build(BuildContext context) {
    var query =querySearch!.replaceAll(' ', ' ');
    final filteredList= query.isEmpty? []
        :widget.notesList.where((element) =>
    element.title.replaceAll(' ', '').toLowerCase().contains(query.toLowerCase())||
        element.content.replaceAll(' ', '').toLowerCase().contains(query.toLowerCase())).toList();
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios_new) ,onPressed: (){
          Navigator.pop(context);
        },),
        title:  SizedBox(
          height: 45,
          width: double.infinity,
          child: TextField(
            onChanged: (value){
              setState(() {
                querySearch=value;
              });
            },
            decoration: InputDecoration(
                hintText: 'search',
                border: buildBorder(),
                focusedBorder: buildBorder(Colors.cyan),
                enabledBorder: buildBorder()
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          const SizedBox(height: 25,),
            Expanded(
              child: ListView.separated(
                  itemCount: filteredList.length,
                  separatorBuilder: (context,index){
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemBuilder: (context,index){
                final note=filteredList[index];
                return  GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditNoteView(noteModel: filteredList[index])));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:  Color(note.color),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: ListTile(
                            title:  Text(note.title,style: const TextStyle(fontSize: 26.0,fontWeight: FontWeight.bold),),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top:8.0,bottom: 50),
                              child: Text(note.content,style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 18,
                              ),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(note.date,style: TextStyle(color: Colors.black.withOpacity(0.4)),),
                        ),
                        const SizedBox(height: 15,)
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      )
    );
  }
  OutlineInputBorder buildBorder([color]){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        )
    );
  }
}
