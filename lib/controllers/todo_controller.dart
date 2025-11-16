import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sample_riverpod_mvc/models/models.dart';

final todoListProvider = StateNotifierProvider<TodoController, List<Todo>>(
  (ref) => TodoController(),
);

final todoByIdProvider = Provider.family<Todo?, String>((ref, id) {
  final todos = ref.watch(todoListProvider);
  for (final todo in todos) {
    if (todo.id == id) {
      return todo;
    }
  }
  return null;
});

class TodoController extends StateNotifier<List<Todo>> {
  TodoController() : super(const []);

  void addTodo(String title) {
    final trimTitle = title.trim();
    if (trimTitle.isEmpty) {
      return;
    }
    state = [
      ...state,
      Todo(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: trimTitle,
      ),
    ];
  }

  void toggleTodo(String id) {
    state = state
        .map(
          (todo) => todo.id == id ? todo.copyWith(isComp: !todo.isComp) : todo,
        )
        .toList();
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
