import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../constant/constans.dart';
import '../../models/note_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;

  fetchAllNotes() {
    notes = Hive.box<NoteModel>(kNotesBox).values.toList();
    emit(NotesSuccess());
  }
}
