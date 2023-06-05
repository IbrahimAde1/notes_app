import 'package:flutter/material.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import '../constant/constans.dart';
import './color_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorList extends StatefulWidget {
  const ColorList({super.key});

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 100,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    currentindex = index;
                    BlocProvider.of<AddNoteCubit>(context).color =
                        kColorList[index];
                    setState(() {});
                  },
                  child: ColorItem(
                      active: currentindex == index,
                      color: Color(kColorList[index])),
                ),
            separatorBuilder: (context, index) =>
                const Padding(padding: EdgeInsets.all(10)),
            physics: const ClampingScrollPhysics(),
            itemCount: kColorList.length),
      ),
    );
  }
}
