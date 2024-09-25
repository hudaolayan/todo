

import '../models/todo_item.dart';

abstract class TodoListState {}

class TodoListInitialState extends TodoListState {}

class TodoListLoadedState extends TodoListState {

  final List<Todo> list;

  TodoListLoadedState(this.list);

}
