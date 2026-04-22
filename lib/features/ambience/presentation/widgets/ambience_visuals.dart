import 'package:flutter/material.dart';

List<Color> ambiencePaletteForTag(String tag) {
  switch (tag) {
    case 'Calm':
      return const [Color(0xFF7D8F68), Color(0xFFC8D8A3)];
    case 'Sleep':
      return const [Color(0xFF9A6E61), Color(0xFFE2C8BA)];
    case 'Reset':
      return const [Color(0xFF5F7B63), Color(0xFFAED0B7)];
    case 'Focus':
    default:
      return const [Color(0xFF5E7C55), Color(0xFFC0D18F)];
  }
}
