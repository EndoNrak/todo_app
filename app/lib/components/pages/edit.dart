import 'package:flutter/material.dart';
import 'package:flutter_app/models/todo_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class EditPage extends HookConsumerWidget {
  const EditPage(this.id, {Key? key}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoModel todo = ref.read(todoListProvider.notifier).getTodo(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO app"),
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: todo.title,
          ),
          Row(
            children: [
              const Icon(Icons.mode_edit_outline),
              // TextFormField(initialValue: todo.title),
              const Icon(Icons.mode_edit_outline),
            ],
          ),
          TextFormField(initialValue: todo.description),
          Text(
              DateFormat('yyyy-MM-dd').format(todo.deadline ?? DateTime.now())),
        ],
      ),
    );
  }
}
