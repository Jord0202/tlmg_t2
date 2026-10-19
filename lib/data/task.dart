class Task {
  Task({
    required this.id,
    required this.title,
    required this.dueAt,
    this.description = '',
    this.completed = false,
  });
  final String id;
  final String title;
  final String description;
  final DateTime dueAt;
  bool completed;
}
