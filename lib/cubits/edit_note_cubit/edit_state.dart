part of 'edit_cubit.dart';

abstract class EditState {}

class EditInitial extends EditState {}

class EditSuccess extends EditState {
  final NoteModel? noteSuccess;
  EditSuccess({this.noteSuccess});
}
