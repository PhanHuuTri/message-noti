import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  fontFamily: 'NotoSans',
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  scaffoldBackgroundColor: const Color(0xFF121212),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.black87,
    shadowColor: Colors.white,
  ),
  cardColor: Color(0xFF1E1E1E),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
    bodySmall: TextStyle(color: Colors.white54, fontSize: 14, fontWeight: FontWeight.w300),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
  ),
);
