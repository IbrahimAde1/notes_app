import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/edit_note_cubit/edit_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'package:intl/intl.dart';
import '../views/edit_note_veiw.dart';
import 'alert_dialog.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;
  final Color color;
  const NoteItem({
    super.key,
    required this.note,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    var dateformat = DateFormat('dd-MMMM-y');
    return Center(
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 18),
            color: Color(note.color),
            elevation: 5,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: const Color.fromARGB(49, 255, 255, 255),
              onTap: () {
                BlocProvider.of<EditCubit>(context).edit(note);
                Navigator.pushNamed(context, EditNote.id);
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 15, top: 20),
                width: MediaQuery.of(context).size.width - 30,
                height: 200,
                child: ListTile(
                  title: Text(
                    note.title,
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  // minVerticalPadding: 20,
                  subtitle: Text(
                    note.note,
                    style: TextStyle(
                        color: Colors.black.withOpacity(.4), fontSize: 18),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => ShowDialog(note: note));
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 25,
            child: Text(
              dateformat.format(note.date).toString(),
              style: TextStyle(color: Colors.black.withOpacity(.4)),
            ),
          ),
        ],
      ),
    );
  }
}
