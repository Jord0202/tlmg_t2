import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFF6757E8);
  static const primaryContainer = Color(0xFFEEEAFE);
  static const onPrimary = Color(0xFFFFFFFF);
  static const background = Color(0xFFF6F8FC);
  static const surface = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF17233F);
  static const textSecondary = Color(0xFF758198);
  static const outline = textSecondary;
  static const error = Color(0xFFBA1A1A);
  static const onError = onPrimary;
  static Color get progressTrack => onPrimary.withValues(alpha: 0.24);
  static ColorScheme get scheme => ColorScheme.fromSeed(
    seedColor: primary,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: primary,
    secondary: primary,
    onSecondary: onPrimary,
    secondaryContainer: primaryContainer,
    onSecondaryContainer: textPrimary,
    tertiary: primary,
    onTertiary: onPrimary,
    tertiaryContainer: primaryContainer,
    onTertiaryContainer: textPrimary,
    surface: surface,
    onSurface: textPrimary,
    onSurfaceVariant: textSecondary,
    outline: outline,
    outlineVariant: primaryContainer,
    error: error,
    onError: onError,
  );
}
