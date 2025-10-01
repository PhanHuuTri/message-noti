import 'package:demo_noti/themes/dark_theme.dart';
import 'package:demo_noti/themes/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  ThemeData get currentTheme => isDarkMode ? darkTheme : lightTheme;
}
