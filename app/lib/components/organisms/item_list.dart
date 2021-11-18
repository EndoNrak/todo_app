import 'package:flutter/material.dart';
import '../molecules/todo_item.dart';

class ItemList extends StatelessWidget {
  ItemList({Key? key}) : super(key: key);
  final List<String> todolist = ['apple', 'banana', 'grape', 'orange'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todolist.length,
      itemBuilder: (context, index) {
        return TodoItem(todo: todolist[index]);
      },
    );
  }
}
