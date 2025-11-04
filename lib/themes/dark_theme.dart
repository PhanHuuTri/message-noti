import 'package:demo_noti/utils/status-color.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'NotoSans',
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  scaffoldBackgroundColor: const Color(0xFF121212),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.black87,
    shadowColor: Colors.deepPurple[800],
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.deepPurple[100],
    textTheme: ButtonTextTheme.primary,
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.deepPurple[800],
    indicatorColor: Colors.deepPurple[800],
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(color: Colors.white),
    ),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return IconThemeData(color: Colors.white);
      }

      return const IconThemeData(color: Colors.black54);
    }),
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.deepPurple,
    primaryContainer: const Color.fromARGB(255, 180, 148, 239),
  ),
  cardColor: Color(0xFF1E1E1E),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: TextStyle(
      color: Colors.white54,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  ),
  extensions: const <ThemeExtension<dynamic>>[
    AppStatusColors(
      success: Color(0xFF1E4620),
      onSuccess: Color(0xFF66BB6A),
      warning: Color(0xFF4B3213),
      onWarning: Color(0xFFFFB74D),
    ),
  ],
);
