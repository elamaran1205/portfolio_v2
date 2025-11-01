import 'package:flutter/material.dart';

class AppColors {
  // Core background colors
  static const Color background = Color(0xFF0D0D0D); // deep black
  static const Color surface = Color(
    0xFF1A1A1A,
  ); // slightly lighter black for cards

  // Accent / Brand colors
  static const Color amber = Color(0xFFFFC107);
  static const Color lightBlue = Color(0xFF03A9F4); // accent for buttons/links

  // Text colors
  static const Color textPrimary = Colors.white;
  static Color textSecondary = Colors.white.withOpacity(0.7);
  static const Color textFaint = Colors.white38;

  // Divider / borders
  static const Color divider = Color(0xFF2C2C2C);

  // Gradients (optional for backgrounds)
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF0D0D0D), Color(0xFF101820)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Glow effects (for neon vibe)
  static const List<BoxShadow> glowAmber = [
    BoxShadow(
      color: Color(0xFFFFC107),
      blurRadius: 15,
      spreadRadius: 1,
      offset: Offset(0, 0),
    ),
  ];

  static const List<BoxShadow> glowBlue = [
    BoxShadow(
      color: Color(0xFF03A9F4),
      blurRadius: 15,
      spreadRadius: 1,
      offset: Offset(0, 0),
    ),
  ];
}
