import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/note_model.dart';
import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitialState());

  // Add a single note and emit it as the new state
  void addNote(String title, String content) {
    final newNote = Note(
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    emit(NoteAddedState(note: newNote)); // Emit new state with the added note
  }

  // Remove the note by returning to the initial state (no note)
  void removeNote() {
    emit(NotesInitialState()); // Return to the initial state when the note is removed
  }
}
