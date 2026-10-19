import 'package:flutter/material.dart';

import '../src/app_colors.dart';

import '../controllers/task_controller.dart';
import '../src/widgets.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key, required this.controller});
  final TaskController controller;
  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: controller,
    builder: (context, _) => TaskLayout(
      back: true,
      children: [
        const Icon(Icons.task_alt, color: AppColors.primary, size: 64),
        const SizedBox(height: 16),
        const Text(
          'Tareas completadas',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Cada tarea completada cuenta.',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textSecondary),
        ),
        const SizedBox(height: 28),
        if (controller.completed.isEmpty)
          const Text(
            'Aún no hay tareas completadas. Marca una tarea cuando la termines.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary),
          ),
        for (final task in controller.completed)
          TaskTile(task: task, onToggle: () => controller.toggle(task)),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Volver a mis tareas'),
        ),
      ],
    ),
  );
}
