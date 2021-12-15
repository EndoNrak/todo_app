import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';
import 'todo_list_view_model.dart';

const _uuid = Uuid();

final todoEditProvider =
    StateNotifierProvider<TodoEditViewModel, TodoModel>((ref) {
  final _todoListProvider = ref.read(todoListProvider.notifier);
  return TodoEditViewModel(
    TodoModel(
      id: 'todo-0',
      title: "aaaa",
      description: "aaaaaaaaaaaaaaaaassssssss",
      deadline: DateTime.utc(2020, 11, 21),
      createdAt: DateTime.utc(2020, 11, 2),
      updatedAt: DateTime.utc(2020, 11, 2),
    ),
    _todoListProvider,
  );
});

class TodoEditViewModel extends StateNotifier<TodoModel> {
  var todoListProvider;

  TodoEditViewModel(TodoModel? todo, this.todoListProvider)
      : super(
          todo ??
              TodoModel(
                id: _uuid.v4(),
                title: "",
                description: "",
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
        );

  void setTodoEdit(TodoModel todo) {
    state = todo;
  }

  void update() {
    todoListProvider.update(state);
  }
}
