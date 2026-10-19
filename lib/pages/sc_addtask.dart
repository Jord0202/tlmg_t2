import 'package:flutter/material.dart';

import '../src/app_colors.dart';

import '../controllers/task_controller.dart';
import '../src/widgets.dart';

class AgregarTarea extends StatefulWidget {
  const AgregarTarea({super.key, required this.controller});
  final TaskController controller;
  @override
  State<AgregarTarea> createState() => _AgregarTareaState();
}

class _AgregarTareaState extends State<AgregarTarea> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _description = TextEditingController();
  DateTime _dueAt = DateTime.now();
  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final value = await showDatePicker(
      context: context,
      initialDate: _dueAt,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (value != null && mounted) {
      setState(
        () => _dueAt = DateTime(
          value.year,
          value.month,
          value.day,
          _dueAt.hour,
          _dueAt.minute,
        ),
      );
    }
  }

  Future<void> _pickTime() async {
    final value = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dueAt),
    );
    if (value != null && mounted) {
      setState(
        () => _dueAt = _dueAt.copyWith(hour: value.hour, minute: value.minute),
      );
    }
  }

  void _save() {
    if (!_form.currentState!.validate()) {
      return;
    }
    widget.controller.add(
      title: _title.text,
      description: _description.text,
      dueAt: _dueAt,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) => TaskLayout(
    back: true,
    children: [
      const Text(
        'Nueva tarea',
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'Organízate.',
        style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
      ),
      const SizedBox(height: 28),
      Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Título de la tarea',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _title,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                hintText: 'Estudiar para la lección',
              ),
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Escribe el título de la tarea'
                  : null,
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Descripción',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Opcional',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _description,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Añade detalles o notas para tu tarea…',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fecha de vencimiento',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              tileColor: AppColors.surface,
              leading: const Icon(
                Icons.calendar_today_outlined,
                color: AppColors.textSecondary,
              ),
              title: Text(dateLabel(_dueAt)),
              trailing: const Icon(Icons.expand_more),
              onTap: _pickDate,
            ),
            const SizedBox(height: 20),
            const Text(
              'Hora',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              tileColor: AppColors.surface,
              leading: const Icon(
                Icons.schedule,
                color: AppColors.textSecondary,
              ),
              title: Text(TimeOfDay.fromDateTime(_dueAt).format(context)),
              trailing: const Icon(Icons.expand_more),
              onTap: _pickTime,
            ),
          ],
        ),
      ),
      const SizedBox(height: 24),
      const TipCard(
        title: 'Un paso a la vez',
        message: 'Cada tarea te acerca a tu objetivo.',
      ),
      const SizedBox(height: 28),
      Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FilledButton(
              onPressed: _save,
              child: const Text('+  Agregar tarea'),
            ),
          ),
        ],
      ),
    ],
  );
}
