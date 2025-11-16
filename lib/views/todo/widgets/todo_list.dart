import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod_mvc/controllers/todo_controller.dart';
import 'package:sample_riverpod_mvc/models/models.dart';
import 'package:sample_riverpod_mvc/views/todo/detail/todo_detail_page.dart';

class TodoList extends ConsumerWidget {
  final List<Todo> todos;

  const TodoList({super.key, required this.todos});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (todos.isEmpty) {
      return const Center(
        child: Text(
          'やることリストはありません',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      );
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          leading: Checkbox(
            value: todo.isComp,
            onChanged: (_) =>
                ref.read(todoListProvider.notifier).toggleTodo(todo.id),
          ),
          title: Text(todo.title),
          trailing: IconButton(
            onPressed: () =>
                ref.read(todoListProvider.notifier).removeTodo(todo.id),
            icon: Icon(Icons.delete),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => TodoDetailPage(id: todo.id)),
            );
          },
        );
      },
      separatorBuilder: (_, __) => Divider(height: 1),
      itemCount: todos.length,
    );
  }
}
