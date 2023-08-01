class TodoState {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  TodoState({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });

  TodoState copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? modifiedTime,
  }) {
    return TodoState(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      modifiedTime: modifiedTime ?? this.modifiedTime,
    );
  }
}
