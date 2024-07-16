import 'package:app_1/my_note_app/screens/note_body.dart';
import 'package:flutter/material.dart';
import 'add_note_bottom_sheet.dart';

class HomeNote extends StatelessWidget {
  const HomeNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const NoteBody(),
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.cyan,
        radius: 30,
        child: IconButton(
            onPressed:(){
              showModalBottomSheet(
                isScrollControlled: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  builder: (context)=> const AddNoteBottomSheet());
            } ,
            icon:const Icon(Icons.add)),
      ),
    );
  }
}


