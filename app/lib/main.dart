import 'package:flutter/material.dart';
import 'package:flutter_app/components/molecules/todo_item.dart';
import 'package:flutter_app/view_models/todo_list_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './components/app.dart';
import './components/organisms/todo_list.dart';
import './models/todo_model.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

final todoListProvider =
    StateNotifierProvider<TodoListViewModel, List<TodoModel>>((ref) {
  return TodoListViewModel([
    TodoModel(
      id: 'todo-0',
      title: "aaaa",
      description: "aaaaaaaaaaaaaaaaassssssss",
      deadline: DateTime.utc(2020, 11, 21),
      createdAt: DateTime.utc(2020, 11, 2),
      updatedAt: DateTime.utc(2020, 11, 2),
    ),
    TodoModel(
      id: 'todo-1',
      title: "bbbb",
      description: "aaaabsssssss",
      createdAt: DateTime.utc(2020, 11, 2),
      updatedAt: DateTime.utc(2020, 11, 2),
    ),
    TodoModel(
      id: 'todo-2',
      title: "cccc",
      description: "bbbbbbbbbbbbbssss",
      createdAt: DateTime.utc(2020, 11, 2),
      updatedAt: DateTime.utc(2020, 11, 2),
    ),
    TodoModel(
      id: 'todo-3',
      title: "addd",
      createdAt: DateTime.utc(2020, 11, 2),
      updatedAt: DateTime.utc(2020, 11, 2),
    ),
  ]);
});
