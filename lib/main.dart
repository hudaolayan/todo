import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo_app.dart';
import 'package:todo/todo_list_cubit/todo_list_cubit.dart';

void main() => runApp(MaterialApp(
      home: BlocProvider(
          create: (BuildContext context) => TodoCubit(),
          child: TodoAppWithStateManagement()),
      theme: ThemeData(primarySwatch: Colors.teal),
    ));
