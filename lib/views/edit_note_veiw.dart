import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/edit_note_cubit/edit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import '../cubits/notes_cubit/notes_cubit.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/edit_color_list.dart';

class EditNote extends StatefulWidget {
  const EditNote({
    super.key,
  });
  static String id = 'EditNote';

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  void initState() {
    BlocProvider.of<EditCubit>(context).state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NoteModel? note = BlocProvider.of<EditCubit>(context).nota;
    return BlocBuilder<EditCubit, EditState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Notes',
                style: TextStyle(fontWeight: FontWeight.bold)),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: FloatingActionButton(
                  mini: true,
                  backgroundColor: const Color.fromARGB(19, 255, 255, 255),
                  onPressed: () {
                    note!.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.done,
                  ),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              CustomTextField(
                onsaved: (p0) => note.title = p0!,
                maxline: 1,
                title: 'title',
                onChanged: (p0) {
                  note.title = p0!;
                },
                initialValue: note!.title,
              ),
              CustomTextField(
                  onChanged: (p0) {
                    note.note = p0!;
                  },
                  maxline: 5,
                  title: 'Content',
                  onsaved: (p1) {
                    note.note = p1!;
                  },
                  initialValue: note.note),
              EditColorList(note: note),
            ],
          ),
        );
      },
    );
  }
}
