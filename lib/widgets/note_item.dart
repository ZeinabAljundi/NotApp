import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onDelete;

  const NoteItem({
    Key? key,
    required this.title,
    required this.content,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(content),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
