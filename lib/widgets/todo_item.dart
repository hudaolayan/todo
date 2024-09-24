import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.title, required this.isDone, required this.onDelete, required this.onToggled});
  final String title;
  final bool isDone;
  final void Function() onDelete;
  final void Function(bool? value) onToggled;
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            decoration:isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: Checkbox(
          value: isDone,
          onChanged: onToggled,
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );;
  }
}
