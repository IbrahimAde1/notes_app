import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import '../../models/note_model.dart';
import '../cubits/notes_cubit/notes_cubit.dart';
import 'custom_text_field.dart';
import './color_list.dart';

class SheetNote extends StatefulWidget {
  const SheetNote({super.key});

  @override
  State<SheetNote> createState() => _SheetNoteState();
}

final GlobalKey<FormState> globalKey = GlobalKey();

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _SheetNoteState extends State<SheetNote> {
  @override
  Widget build(BuildContext context) {
    String? title, note;

    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          } else if (state is AddNoteFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: globalKey,
                autovalidateMode: autovalidateMode,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('Add New Note',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ),
                      AbsorbPointer(
                        absorbing: state is AddNoteLoding ? true : false,
                        child: Column(
                          children: [
                            CustomTextField(
                                onChanged: (p0) => title = p0,
                                maxline: 1,
                                title: 'title',
                                onsaved: (value) {
                                  title = value;
                                }),
                            CustomTextField(
                              onChanged: (p0) => note = p0,
                              maxline: 5,
                              title: 'note',
                              onsaved: (p0) => note = p0,
                            ),
                            const Text(
                              'Chose Color',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const ColorList(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                globalKey.currentState!.save();
                                var noteModel = NoteModel(
                                    title: title!,
                                    note: note!,
                                    date: DateTime.now(),
                                    color:
                                        BlocProvider.of<AddNoteCubit>(context)
                                            .color);
                                BlocProvider.of<AddNoteCubit>(context)
                                    .addNote(noteModel);
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                            style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.all(20)),
                              elevation: MaterialStateProperty.all(80),
                            ),
                            child: state is AddNoteLoding
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Add',
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
