
import '../models/note_model.dart';
abstract class NotesState {}

class NotesInitialState extends NotesState {
}

class NoteAddedState extends NotesState {
  final Note note;

  NoteAddedState({required this.note});
}
