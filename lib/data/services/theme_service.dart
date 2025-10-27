import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService extends GetxService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  // 1. Rx variable for the UI to listen to
  late final Rx<ThemeMode> theme;

  @override
  void onInit() {
    super.onInit();
    // 2. Read the saved value when initializing the service
    theme = _loadThemeFromBox().obs;
  }

  // 3. Internal function to read from storage
  ThemeMode _loadThemeFromBox() {
    // Default to system theme if nothing is saved
    bool isDarkMode = _box.read(_key) ?? (Get.isPlatformDarkMode); 
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  // 4. Internal function to write to storage
  void _saveThemeToBox(bool isDarkMode) {
    _box.write(_key, isDarkMode);
  }

  // 5. Public function for the UI to call
  void switchTheme() {
    bool isDarkMode = theme.value == ThemeMode.light;
    _saveThemeToBox(isDarkMode);
    theme.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}