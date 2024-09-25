import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo_item.dart';
import 'package:todo/todo_list_cubit/todo_list_state.dart';

class TodoCubit extends Cubit<TodoListState> {
  TodoCubit() : super(TodoListInitialState());

  void addItem(String title) {
    final newItem = Todo(title: title);

    if (state is TodoListInitialState) {
      emit(TodoListLoadedState([newItem]));
    } else {
      emit(TodoListLoadedState(
          [...(state as TodoListLoadedState).list, newItem]));
    }
  }

  void toggleTodoStatus(int index) {
    final List<Todo> notesList = List.from((state as TodoListLoadedState).list);
    notesList.elementAt(index).isDone = !notesList.elementAt(index).isDone;
    emit(TodoListLoadedState(notesList));
  }

  void removeItem(int index) {
    final List<Todo> updatedNotes =
        List.from((state as TodoListLoadedState).list)..removeAt(index);
    if (updatedNotes.isEmpty) {
      emit(TodoListInitialState());
    } else {
      emit(TodoListLoadedState(updatedNotes));
    }
  }
}
