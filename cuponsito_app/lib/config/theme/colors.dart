import 'package:flutter/material.dart';

class AppColors {
  // Main Colors
  static const Color primary = Color(0xFF13EC5B);
  static const Color primaryDark = Color(0xFF0DBD49); // From Login HTML
  static const Color primaryDarker = Color(
    0xFF1EA34D,
  ); // From Register HTML gradient

  // Backgrounds
  static const Color backgroundLight = Color(
    0xFFF8FAF9,
  ); // Updated from HTML #f8faf9
  static const Color backgroundDark = Color(0xFF102216); // Base dark
  static const Color backgroundDarkAlt = Color(
    0xFF0A120D,
  ); // Deep dark from Login HTML
  static const Color backgroundDarker = Color(0xFF0C1A12); // From Register HTML

  // Text Colors
  static const Color textDark = Color(0xFF111813);
  static const Color textMuted = Color(0xFF61896F);

  // Borders & UI Elements
  static const Color borderLight = Color(0xFFDBE6DF);
  static const Color borderDark = Color(0xFF2A3D31); // Dark mode border

  // Gradients
  static const LinearGradient homeOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(16, 34, 22, 0.4),
      Color.fromRGBO(16, 34, 22, 0.85),
    ],
    stops: [0.0, 1.0],
  );

  static const LinearGradient registerButtonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF2BEE6C),
      Color(0xFF1EA34D),
    ],
  );
}
