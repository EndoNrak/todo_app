import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.todo}) : super(key: key);

  final String todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.local_fire_department),
        color: Colors.red,
        onPressed: () {},
      ),
      title: Text(todo),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        color: Colors.grey,
        onPressed: () {},
      ),
      onTap: () {},
    );
  }
}
