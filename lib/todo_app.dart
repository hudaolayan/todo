import 'package:flutter/material.dart';
import 'package:todo/widgets/todo_item.dart';
import 'models/todo_item.dart';

class TodoAppWithoutStateManagement extends StatefulWidget {
  @override
  _TodoAppWithoutStateManagementState createState() =>
      _TodoAppWithoutStateManagementState();
}

class _TodoAppWithoutStateManagementState
    extends State<TodoAppWithoutStateManagement> {
  final List<Todo> _todos = [];

  void _addTodo(String title) {
    setState(() {
      _todos.add(Todo(
        title: title,
      ));
    });
  }

  void _toggleTodoStatus(int index) {
    setState(() {
      _todos[index].isDone = !_todos[index].isDone;
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  void _showAddTodoDialog() {
    final _titleController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Task"),
        content: TextField(
          controller: _titleController,
          decoration: const InputDecoration(labelText: "Task Title"),
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
              _addTodo(_titleController.text);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: _todos.isEmpty
          ? const Center(child: Text('No Tasks Available'))
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return TodoItem(
                    title: todo.title,
                    isDone: todo.isDone,
                    onDelete: () => _deleteTodo(index),
                    onToggled: (value) => _toggleTodoStatus(index));
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
