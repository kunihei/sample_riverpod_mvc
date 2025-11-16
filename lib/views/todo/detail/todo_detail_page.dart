import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod_mvc/controllers/todo_controller.dart';
import 'package:sample_riverpod_mvc/views/todo/widgets/detail/detail.dart';

class TodoDetailPage extends ConsumerWidget {
  final String id;
  const TodoDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoByIdProvider(id));
    return Scaffold(
      appBar: AppBar(title: const Text('詳細')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [Detail(todo: todo)]),
      ),
    );
  }
}
