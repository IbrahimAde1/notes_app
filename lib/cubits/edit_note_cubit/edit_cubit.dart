import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(EditInitial());

  NoteModel? nota;
  void edit(NoteModel note) {
    nota = note;
    emit(EditSuccess());
  }
}
