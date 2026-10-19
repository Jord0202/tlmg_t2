import 'package:flutter/material.dart';

import '../src/app_colors.dart';

import '../controllers/task_controller.dart';
import '../src/widgets.dart';
import 'sc_addtask.dart';
import 'sc_completed.dart';

class MisTareasMobile375X812 extends StatelessWidget {
  const MisTareasMobile375X812({super.key, required this.controller});
  final TaskController controller;
  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: controller,
    builder: (context, _) => TaskLayout(
      children: [
        Text(
          dateLabel(DateTime.now()),
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
        const SizedBox(height: 8),
        const Text(
          'Organiza tus tareas',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Bienvenido',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Tu progreso de hoy',
                      style: TextStyle(color: AppColors.onPrimary),
                    ),
                  ),
                  Text(
                    '${controller.completedToday} de ${controller.today.length}',
                    style: const TextStyle(
                      color: AppColors.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: controller.progress,
                color: AppColors.onPrimary,
                backgroundColor: AppColors.progressTrack,
                minHeight: 7,
                borderRadius: BorderRadius.circular(8),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            const Expanded(
              child: Text(
                'Tareas pendientes',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '${controller.pending.length} pendientes',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        if (controller.pending.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              '¡Todo al día! Agrega una nueva tarea.',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
        for (final task in controller.pending)
          TaskTile(task: task, onToggle: () => controller.toggle(task)),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => CompletedPage(controller: controller),
              ),
            ),
            icon: const Icon(Icons.task_alt),
            label: Text('Completadas (${controller.completed.length})'),
          ),
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: () => _add(context),
          icon: const Icon(Icons.add),
          label: const Text('Agregar una tarea'),
        ),
        const SizedBox(height: 20),
        const TipCard(
          title: '¡Bienvenido!',
          message: 'Cada tarea completada cuenta.',
        ),
      ],
    ),
  );
  void _add(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (_) => AgregarTarea(controller: controller),
    ),
  );
}
