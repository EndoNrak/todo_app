import 'package:flutter/material.dart';
import '../organisms/todo_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TodoList(),
    );
  }
}
