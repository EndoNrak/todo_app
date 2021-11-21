import 'package:flutter/material.dart';
import 'package:flutter_app/models/todo_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TodoListViewModel extends StateNotifier<List<TodoModel>> {
  TodoListViewModel(List<TodoModel>? initialTodoList)
      : super(initialTodoList ?? []);
  void addTodoItem(String title, String description) {
    state = [
      ...state,
      TodoModel(
        id: _uuid.v4(),
        title: title,
        description: description,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
  }

  void toggleIsDone(String id) {
    state = [
      for (final todoItem in state)
        if (todoItem.id == id)
          TodoModel(
            id: todoItem.id,
            title: todoItem.title,
            isDone: !todoItem.isDone,
            description: todoItem.description,
            createdAt: todoItem.createdAt,
            updatedAt: DateTime.now(),
          )
        else
          todoItem,
    ];
  }

  void remove(String id) {
    state = state.where((todoItem) => todoItem.id != id).toList();
  }
}
