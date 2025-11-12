class Todo {
  final String id;
  final String title;
  final bool isComp;

  Todo({required this.id, required this.title, this.isComp = false});

  Todo copyWith({String? id, String? title, bool? isComp}) {
    return Todo(
      id: id ?? this.title,
      title: title ?? this.title,
      isComp: isComp ?? this.isComp,
    );
  }
}
