import 'package:demo_noti/utils/status-color.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'NotoSans',
  primaryColor: Colors.deepPurple[400],
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple[400]!,
    brightness: Brightness.light,
    primaryContainer: Colors.deepPurple[100],
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple[400],
    foregroundColor: Colors.white,
    shadowColor: Colors.black,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.deepPurple[400],
    textTheme: ButtonTextTheme.primary,
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
  extensions: const <ThemeExtension<dynamic>>[
    AppStatusColors(
      success: Color.fromARGB(255, 142, 238, 150),
      onSuccess: Color(0xFF2E7D32),
      warning: Color.fromARGB(255, 241, 203, 142),
      onWarning: Color(0xFFEF6C00),
    ),
  ],
);
