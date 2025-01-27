import 'package:flutter/material.dart';
import 'package:general_app_package/component/theme_sets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeNotifier() {
    _loadTheme();
  }

  ThemeMode? _themeMode;
  ThemeData? _darkTheme;
  ThemeData? _lightTheme;
  ThemeDataTween? _colorTheme;

  ThemeMode get themeMode => _themeMode ?? ThemeMode.system;
  ThemeData get darkTheme => _darkTheme ?? ThemeData.dark();
  ThemeData get lightTheme => _lightTheme ?? ThemeData.light();
  ThemeDataTween get colorTheme => _colorTheme ?? Themes.defaultValue;

  void setTheme(ThemeDataTween themeData) async {
    _colorTheme = themeData;
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int isDark = prefs.getInt('theme') ?? 0;
    if (isDark == 0) {
      _lightTheme = lightTheme;
    } else {
      _darkTheme = darkTheme;
    }
    notifyListeners();
  }

  void toogleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void updateDarkTheme(ThemeData newTheme) {
    _darkTheme = newTheme;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setInt('theme', 1);
    });
  }

  void updateLightTheme(ThemeData newTheme) {
    _lightTheme = newTheme;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setInt('theme', 0);
    });
  }
}
