import 'task.dart';

class TaskRepository {
  final List<Task> _tasks = [
    Task(
      id: 'reading',
      title: 'Control de lectura',
      dueAt: DateTime.now().copyWith(hour: 10, minute: 0),
    ),
    Task(
      id: 'project',
      title: 'Proyecto Metodología',
      dueAt: DateTime.now().copyWith(hour: 14, minute: 30),
    ),
  ];
  List<Task> get tasks => List.unmodifiable(_tasks);
  void add(Task task) => _tasks.add(task);
}
