# TASKLY
Mini app Flutter de tareas que conserva el estilo de las interfaces originales.

- lib/pages: lista, formulario y pantalla de completadas.
- lib/controllers: estado compartido, creación y cambios de estado.
- lib/data: modelo y repositorio con dos tareas de ejemplo.
- lib/src: aplicación, tema y componentes visuales compartidos.

Ejecutar: flutter run
Validar: flutter analyze y flutter test

Permite agregar título, descripción opcional, fecha y hora; completar y recuperar
tareas; y consultar el progreso de hoy. La lista muestra todas las pendientes,
incluidas las de otras fechas. Los datos se mantienen en memoria durante la sesión;
al reiniciar la aplicación se restauran las tareas de ejemplo.

## Colores
La paleta se configura en lib/src/app_colors.dart, equivalente a variables CSS:
AppColors.primary (marca), primaryContainer (fondo suave), onPrimary (texto
sobre la marca), background (fondo), surface (tarjetas/campos), textPrimary,
textSecondary, outline y error. Los controles Material heredan AppColors.scheme.
Cambia estos valores y realiza hot reload para ver el resultado.
