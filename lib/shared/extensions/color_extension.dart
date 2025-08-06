import 'package:flutter/material.dart';

extension ColorOpacityExtension on Color {
  /// Converts a percentage (0–100) to a corresponding
  ///  alpha and returns a new color
  Color withOpacityPercent(int percent) {
    final clamped = percent.clamp(0, 100);
    final alpha = ((clamped / 100) * 255).round();
    return withAlpha(alpha);
  }
}
