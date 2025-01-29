import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeNotifier() {
    _loadTheme();
  }

  ThemeMode? _themeMode;
  ThemeData? _darkTheme;
  ThemeData? _lightTheme;

  ThemeMode get themeMode => _themeMode ?? ThemeMode.system;
  ThemeData get darkTheme => _darkTheme ?? ThemeData.dark();
  ThemeData get lightTheme => _lightTheme ?? ThemeData.light();

  void setTheme(ThemeDataTween themeData) async {
    _darkTheme = themeData.end;
    _lightTheme = themeData.begin;
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeModeString = prefs.getString('themeMode');
    _themeMode = _themeStringToMode(themeModeString);
    int isDark = prefs.getInt('theme') ?? 0;
    if (isDark == 0) {
      _lightTheme = lightTheme;
    } else {
      _darkTheme = darkTheme;
    }
    notifyListeners();
  }

  void toogleTheme(ThemeMode mode) async {
    _themeMode = mode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', mode.toString());
    notifyListeners();
  }

  ThemeMode _themeStringToMode(String? themeModeString) {
    switch (themeModeString) {
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      case 'ThemeMode.light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  void updateDarkTheme(ThemeData newTheme) {
    _darkTheme = newTheme;
    notifyListeners();
  }

  void updateLightTheme(ThemeData newTheme) {
    _lightTheme = newTheme;
    notifyListeners();
  }
}
