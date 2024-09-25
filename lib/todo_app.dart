import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo_list_cubit/todo_list_cubit.dart';
import 'package:todo/todo_list_cubit/todo_list_state.dart';
import 'package:todo/widgets/todo_item.dart';

class TodoAppWithStateManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    addItem(String title) {
      context.read<TodoCubit>().addItem(title);
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
                addItem(_titleController.text);
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
          title: const Text('My Tasks'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(child:
              BlocBuilder<TodoCubit, TodoListState>(builder: (context, state) {
            if (state is TodoListInitialState) {
              return const Center(child: Text('No Tasks Available'));
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: (state as TodoListLoadedState).list.length,
                itemBuilder: (context, index) {
                  final todo = (state).list[index];
                  return TodoItem(
                      title: todo.title,
                      isDone: todo.isDone,
                      onDelete: () =>
                          context.read<TodoCubit>().removeItem(index),
                      onToggled: (value) =>
                          context.read<TodoCubit>().toggleTodoStatus(index));
                },
              );
            }
          }))
        ])),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddTodoDialog,
          child: const Icon(Icons.add),
          backgroundColor: Colors.teal,
        ));
  }
}
