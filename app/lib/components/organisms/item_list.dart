import 'package:flutter/material.dart';
import '../molecules/item.dart';

class ItemList extends StatelessWidget {
  ItemList({Key? key}) : super(key: key);
  final List<String> todolist = ['apple', 'banana', 'grape', 'orange'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TodoItem(todo: "cooking"),
        TodoItem(todo: "having dinner"),
      ],
    );
  }
}
