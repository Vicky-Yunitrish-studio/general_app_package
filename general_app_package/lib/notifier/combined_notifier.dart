import 'package:flutter/material.dart';
import 'package:general_app_package/notifier/locale_notifier.dart';
import 'package:general_app_package/notifier/theme_notifier.dart';

class CombinedNotifier with ChangeNotifier {
  final List<ChangeNotifier> _notifiers;

  CombinedNotifier(this._notifiers) {
    for (final notifier in _notifiers) {
      notifier.addListener(_onNotifierChanged);
    }
  }

  ThemeNotifier? get themeNotifier =>
      _notifiers.firstWhere((notifier) => notifier is ThemeNotifier)
          as ThemeNotifier;

  LocaleNotifier? get localeNotifier =>
      _notifiers.firstWhere((notifier) => notifier is LocaleNotifier)
          as LocaleNotifier;

  void _onNotifierChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    for (final notifier in _notifiers) {
      notifier.removeListener(_onNotifierChanged);
    }
    super.dispose();
  }
}
