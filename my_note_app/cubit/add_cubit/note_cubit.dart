import 'package:app_1/constants.dart';
import 'package:app_1/my_note_app/note_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'note_states.dart';

class AddNoteCubit extends Cubit<AddNoteStates>{
  AddNoteCubit() :super (InitialAddNoteStates());
  Color color= const Color(0xff223843);
void addNote(NoteModel note){
  note.color=color.value;
  emit(LoadingAddNoteStates());
  try{
    var noteBox=Hive.box<NoteModel>(kNoteBox);
    noteBox.add(note);
    emit(SuccessAddNoteStates());
  }
  catch(e){
    emit(FailedAddNoteStates(e.toString()));
  }
}
}