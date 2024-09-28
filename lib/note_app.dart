import 'package:ayah1/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'NotesCubit/notes_cubit.dart';
import 'NotesCubit/notes_state.dart';
import 'models/note_model.dart';

class NoteAppWithoutStateManagement extends StatelessWidget {
  NoteAppWithoutStateManagement({super.key});

  @override
  Widget build(BuildContext context) {

    // Function to add a note
    addNote(String title, String content) {
      context.read<NotesCubit>().addNote(title, content);
    }

    // Dialog for adding a note
    void _showAddNoteDialog() {
      final _titleController = TextEditingController();
      final _contentController = TextEditingController();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Add New Note"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: "Content"),
                maxLines: 4,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                addNote(_titleController.text, _contentController.text);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesInitialState) {
            // If there are no notes, show a message
            return const Center(child: Text('No Notes Available'));
          } else if (state is NoteAddedState) {
            // If a note is available, display it
            final note = state.note;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: NoteItem(
                title: note.title,
                content: note.content,
                onDelete: () {
                  context.read<NotesCubit>().removeNote(); // Remove the note
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNoteDialog,
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),
    );
  }
}
