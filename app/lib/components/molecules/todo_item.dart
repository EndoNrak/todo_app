import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/todo_model.dart';
import '../../view_models/todo_edit_view_model.dart';
import '../../view_models/todo_list_view_model.dart';
import '../pages/edit.dart';

class TodoItem extends HookConsumerWidget {
  TodoItem({Key? key, required this.todo}) : super(key: key);

  final TodoModel todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.local_fire_department),
        color: (todo.isDone == false) ? Colors.red : Colors.grey,
        onPressed: () {
          ref.read(todoListProvider.notifier).toggleIsDone(todo.id);
        },
      ),
      title: Text(todo.title),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        color: Colors.grey,
        onPressed: () {},
      ),
      onTap: () {
        ref.read(todoEditProvider.notifier).setTodoEdit(todo);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditPage()),
        );
      },
    );
  }
}
