import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/add_cubit/note_cubit.dart';
import '../cubit/add_cubit/note_states.dart';
import '../cubit/read_cubit/cubit.dart';
import 'model_bottom_sheet.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit,AddNoteStates>(
        listener: (context,state){
          if (state is FailedAddNoteStates){
            debugPrint('failed to add note');
          }
          if(state is SuccessAddNoteStates){
            BlocProvider.of<ReadNoteCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context,state){
          return Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const ModalBottomSheet(),
          );
        },
      ),
    );
  }
}