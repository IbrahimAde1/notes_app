import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../constant/constans.dart';
import '../../models/note_model.dart';
import 'package:flutter/material.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  int color = Colors.amber.value;
  void addNote(NoteModel note) async {
    emit(AddNoteLoding());

    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      note.color = color;
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
