import 'package:ayah1/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'NotesCubit/notes_cubit.dart';
import 'models/note_model.dart';

class NoteAppWithoutStateManagement extends StatelessWidget {
   NoteAppWithoutStateManagement({super.key});



  @override
  Widget build(BuildContext context) {

    addNote(String title , String content){

      context.read<NotesCubit>().addNote(title,content);

    }

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
                addNote(_titleController.text,_contentController.text);
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
      body:
          BlocBuilder<NotesCubit,List<Note>>(
            builder: (context, state){
              if(state.isEmpty){
                return const Center(child: Text('No Notes Available'));
              }
              else{
             return   ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: state.length,
                        itemBuilder: (context, index) {
                          final note = state[index];
                          return NoteItem(
                              title: note.title,
                              content: note.content,
                              onDelete: () {
                                context.read<NotesCubit>().removeNote(index);
                              });
                        },
                      );
              }
            },
          )
      ,
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNoteDialog,
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),
    );
  }
}
