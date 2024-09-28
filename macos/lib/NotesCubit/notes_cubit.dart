import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/note_model.dart';

class NotesCubit extends Cubit<List<Note>> {
  NotesCubit() : super([]);

  void addNote(String title, String content) {
    final newNote =
        Note(title: title, content: content,
            createdAt: DateTime.now());
      emit([...state, newNote]);
  }


  void removeNote(int index)
  {
   final List<Note> updatedNotes= List.from(state)..removeAt(index);
    emit(updatedNotes);
  }
}
