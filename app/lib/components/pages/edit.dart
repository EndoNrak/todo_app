import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../organisms/todo_edit_form.dart';

class EditPage extends HookConsumerWidget {
  const EditPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO app"),
      ),
      body: TodoEditForm(),
    );
  }
}
