import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.title, required this.content, required this.onDelete});
  final String title;
  final String content;
  final void Function() onDelete;
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );;
  }
}
