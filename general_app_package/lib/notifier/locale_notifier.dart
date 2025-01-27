import 'package:flutter/material.dart';

class LocaleNotifier with ChangeNotifier {
  Locale _locale = const Locale('en', 'US');

  Locale get locale => _locale;

  void updateLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
