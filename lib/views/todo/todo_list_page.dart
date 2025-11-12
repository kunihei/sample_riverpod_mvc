import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod_mvc/controllers/controllers.dart';
import 'package:sample_riverpod_mvc/views/todo/widgets/widgets.dart';

class TodoListPage extends ConsumerStatefulWidget {
  const TodoListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoListPageState();
}

class _TodoListPageState extends ConsumerState<TodoListPage> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submit() {
    final title = _textController.text;

    ref.read(todoListProvider.notifier).addTodo(title);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('やることリスト一覧')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(hintText: 'やることを入力してください'),
                  ),
                ),
                SizedBox(width: 8),
                TextButton(onPressed: _submit, child: const Text('追加')),
              ],
            ),
            SizedBox(height: 20),
            Expanded(child: TodoList(todos: todos)),
          ],
        ),
      ),
    );
  }
}
