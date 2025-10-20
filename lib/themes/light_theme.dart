import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'NotoSans',
  primaryColor: Colors.deepPurple[400],
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple[400]!,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple[400],
    foregroundColor: Colors.white,
    shadowColor: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
    bodySmall: TextStyle(color: Colors.black54, fontSize: 14),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(color: Colors.black, fontSize: 14),
  ),
);
