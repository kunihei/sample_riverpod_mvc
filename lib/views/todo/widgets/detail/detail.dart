import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod_mvc/controllers/controllers.dart';
import 'package:sample_riverpod_mvc/models/models.dart';
import 'package:sample_riverpod_mvc/views/todo/widgets/widgets.dart';

class Detail extends ConsumerWidget {
  final Todo? todo;

  const Detail({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = this.todo;
    if (todo == null) {
      return DetailNone();
    }
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(todo.title),
          SizedBox(height: 10),
          Row(
            children: [
              Text('現在の状態：'),
              SizedBox(width: 8),
              Chip(
                label: Text(todo.isComp ? '完了' : '未完了'),
                backgroundColor: todo.isComp
                    ? Colors.green.shade100
                    : Colors.redAccent.shade100,
              ),
            ],
          ),
          SizedBox(height: 10),
          FilledButton.icon(
            onPressed: () =>
                ref.read(todoListProvider.notifier).toggleTodo(todo.id),
            icon: Icon(todo.isComp ? Icons.refresh : Icons.check),
            label: Text(todo.isComp ? '未完了に戻す' : '完了にする'),
          ),
        ],
      ),
    );
  }
}
