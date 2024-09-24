import 'package:flutter/material.dart';
import 'package:todo/todo_app.dart';



void main() => runApp(MaterialApp(
  home: TodoAppWithoutStateManagement(),
  theme: ThemeData(primarySwatch: Colors.teal),
));
