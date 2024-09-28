import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:notes_app/NotesCubit/notes_cubit.dart';
import 'NotesCubit/notes_cubit.dart';
import 'note_app.dart';

void main() => runApp(MaterialApp(
      home:  BlocProvider(
        create: (BuildContext context)=> NotesCubit(),
        child: NoteAppWithoutStateManagement(),
      ),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    ));
