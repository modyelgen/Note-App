import 'package:app_1/constants.dart';
import 'package:app_1/my_note_app/cubit/add_cubit/note_cubit.dart';
import 'package:app_1/my_note_app/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_circle.dart';
class ListEditColorPicker extends StatefulWidget {
  const ListEditColorPicker({Key? key,required this.noteModel}) : super(key: key);
final NoteModel noteModel;
  @override
  State<ListEditColorPicker> createState() => _ListEditColorPickerState();
}

class _ListEditColorPickerState extends State<ListEditColorPicker> {
  int currentIndex=0;
  @override
  void initState() {
   currentIndex=widget.noteModel.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context,index){
            return const SizedBox(width: 10,);
          },
          itemCount: kColors.length,
          itemBuilder: (context,index){
            return GestureDetector(onTap: (){
              currentIndex=index;
             widget.noteModel.color=kColors[index].value;
              setState(() {

              });
            },child: ColorCircle(isPressed: currentIndex==index,color: kColors[index],));
          }),
    );
  }
}