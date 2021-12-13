import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_models/todo_list_view_model.dart';
import '../molecules/todo_item.dart';

class TodoList extends HookConsumerWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return TodoItem(todo: todoList[index]);
      },
    );
  }
}
