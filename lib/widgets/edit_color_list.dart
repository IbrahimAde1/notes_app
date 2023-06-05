import 'package:flutter/material.dart';

import '../constant/constans.dart';
import '../models/note_model.dart';
import 'color_item.dart';

class EditColorList extends StatefulWidget {
  const EditColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditColorList> createState() => _EditColorListState();
}

class _EditColorListState extends State<EditColorList> {
  late int currentindex;
  @override
  void initState() {
    currentindex = kColorList.indexOf(widget.note.color);

    super.initState();
  }

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
                    widget.note.color = kColorList[index];
                    currentindex = index;
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
