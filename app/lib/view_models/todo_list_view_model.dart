import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';

const _uuid = Uuid();

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

  void update(TodoModel todo) {
    state = [
      for (final todoItem in state)
        if (todoItem.id == todo.id)
          TodoModel(
            id: todoItem.id,
            title: todo.title,
            isDone: todo.isDone,
            description: todo.description,
            createdAt: todo.createdAt,
            updatedAt: DateTime.now(),
          )
        else
          todoItem,
    ];
  }

  void remove(String id) {
    state = state.where((todoItem) => todoItem.id != id).toList();
  }

  TodoModel getTodo(String id) {
    return state.firstWhere((todo) => todo.id == id);
  }
}
