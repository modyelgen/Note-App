import 'package:app_1/constants.dart';
import 'package:app_1/my_note_app/cubit/read_cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../note_model.dart';

class ReadNoteCubit extends Cubit<ReadNoteStates>
{
  ReadNoteCubit():super(InitialReadNoteState());
  List<NoteModel>?notes;
   fetchAllNotes()
   {
    var noteBox=Hive.box<NoteModel>(kNoteBox);
    notes=noteBox.values.toList();
    emit(SuccessReadNoteState());
  }
}