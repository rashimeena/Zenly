import 'package:flutter/material.dart';

/// AppColors defines the color palette and semantic color roles for the Ambience App
/// It uses a "Zen" aesthetic with earthy greens and soft creams.
class AppColors {
  // Premium Zen Palette (from HTML)
  static const Color background = Color(0xFFFBFCD6);
  static const Color surface = Color(0xFFFBFCD6);
  static const Color primary = Color(0xFF3B6848);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF98C9A3);
  static const Color onPrimaryContainer = Color(0xFF285537);
  static const Color secondary = Color(0xFF4E644E);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFCDE6CB);
  static const Color surfaceVariant = Color(0xFFE4E5C0);
  static const Color onSurface = Color(0xFF1B1D07);
  static const Color onSurfaceVariant = Color(0xFF414942);
  static const Color surfaceContainerHigh = Color(0xFFEAEBC6);
  static const Color tertiary = Color(0xFF1E6A53);
  static const Color error = Color(0xFFBA1A1A);

  // Typography & UI
  static const Color textPrimary = onSurface;
  static const Color textSecondary = onSurfaceVariant;
  static const Color border = Color(0x1A717971); // Based on outline color with opacity
  static const Color shadow = Color(0x143B6848); // Subtle primary-tinted shadow
}
