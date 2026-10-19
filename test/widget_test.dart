import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tlmg_t2/main.dart';

void main() {
  testWidgets('Crear, completar y recuperar una tarea', (tester) async {
    tester.view.physicalSize = const Size(375, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MyApp());
    expect(find.text('Control de lectura'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.tap(find.text('+  Agregar tarea'));
    await tester.pumpAndSettle();
    expect(find.text('Escribe el t\u00edtulo de la tarea'), findsOneWidget);
    await tester.enterText(
      find.byType(TextFormField).first,
      'Preparar entrega',
    );
    tester.testTextInput.hide();
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('+  Agregar tarea'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('+  Agregar tarea'));
    await tester.pumpAndSettle();
    expect(find.text('Preparar entrega'), findsOneWidget);
    await tester.tap(find.byType(Checkbox).first);
    await tester.pumpAndSettle();
    expect(find.text('Control de lectura'), findsNothing);
    await tester.tap(find.text('Completadas (1)'));
    await tester.pumpAndSettle();
    expect(find.text('Tareas completadas'), findsOneWidget);
    expect(find.text('Control de lectura'), findsOneWidget);
    await tester.tap(find.byType(Checkbox).first);
    await tester.pumpAndSettle();
    expect(find.text('Control de lectura'), findsNothing);
    await tester.tap(find.text('Volver a mis tareas'));
    await tester.pumpAndSettle();
    expect(find.text('Control de lectura'), findsOneWidget);
  });
}
