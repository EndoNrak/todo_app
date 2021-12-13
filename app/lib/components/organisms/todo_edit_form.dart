import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/todo_model.dart';
import '../../view_models/todo_edit_view_model.dart';
import '../../view_models/todo_list_view_model.dart';

@immutable
class TodoEditForm extends HookConsumerWidget {
  TodoEditForm({Key? key}) : super(key: key);
  late TodoModel todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    todo = ref.watch(todoEditProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(border: InputBorder.none),
            initialValue: todo.title,
            style: const TextStyle(fontSize: 24),
            validator: (value) {
              if (value != null) {
                return 'Please input some text';
              }
              return null;
            },
            onChanged: (value) => todo.title = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.insert_comment),
                labelText: "description",
                border: InputBorder.none),
            initialValue: todo.description,
            onChanged: (value) => todo.description = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              labelText: "deadline",
              border: InputBorder.none,
            ),
            initialValue: DateFormat('yyyy-MM-dd')
                .format(todo.deadline ?? DateTime.now()),
            // onChanged: (value) => todo.deadline = DateTime(value),
          ),
          ElevatedButton(
            child: const Text("Save"),
            onPressed: () {
              ref.read(todoListProvider.notifier).update(todo);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
