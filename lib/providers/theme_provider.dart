import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider extends ChangeNotifier {
  late Box _settingsBox;
  ThemeMode _themeMode = ThemeMode.system;

  ThemeProvider() {
    _init();
  }

  Future<void> _init() async {
    _settingsBox = Hive.box('settings');
    final savedTheme = _settingsBox.get('themeMode', defaultValue: 'system');
    _themeMode = _themeModeFromString(savedTheme);
    notifyListeners();
  }

  ThemeMode get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _settingsBox.put('themeMode', _themeModeToString(mode));
    notifyListeners();
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }

  ThemeMode _themeModeFromString(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}