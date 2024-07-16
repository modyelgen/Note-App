import 'package:app_1/constants.dart';
import 'package:app_1/my_note_app/cubit/add_cubit/note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_circle.dart';
class ListColorPicker extends StatefulWidget {
  const ListColorPicker({Key? key,}) : super(key: key);

  @override
  State<ListColorPicker> createState() => _ListColorPickerState();
}

class _ListColorPickerState extends State<ListColorPicker> {
int currentIndex=0;
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
              BlocProvider.of<AddNoteCubit>(context).color=kColors[index];
              setState(() {

              });
            },child: ColorCircle(isPressed: currentIndex==index,color: kColors[index],));
          }),
    );
  }
}