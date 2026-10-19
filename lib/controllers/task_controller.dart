import 'package:flutter/foundation.dart';

import '../data/task.dart';
import '../data/task_repository.dart';

class TaskController extends ChangeNotifier {
  TaskController({TaskRepository? repository})
    : _repository = repository ?? TaskRepository();
  final TaskRepository _repository;
  int _nextId = 0;
  List<Task> get tasks => _repository.tasks;
  List<Task> get pending => tasks.where((task) => !task.completed).toList();
  List<Task> get completed => tasks.where((task) => task.completed).toList();
  List<Task> get today => tasks.where((task) {
    final now = DateTime.now();
    return task.dueAt.year == now.year &&
        task.dueAt.month == now.month &&
        task.dueAt.day == now.day;
  }).toList();
  int get completedToday => today.where((task) => task.completed).length;
  double get progress => today.isEmpty ? 0 : completedToday / today.length;
  void add({
    required String title,
    String description = '',
    required DateTime dueAt,
  }) {
    if (title.trim().isEmpty) {
      throw ArgumentError('Escribe un título');
    }
    _repository.add(
      Task(
        id: 'task-${DateTime.now().microsecondsSinceEpoch}-${_nextId++}',
        title: title.trim(),
        description: description.trim(),
        dueAt: dueAt,
      ),
    );
    notifyListeners();
  }

  void toggle(Task task) {
    task.completed = !task.completed;
    notifyListeners();
  }
}
