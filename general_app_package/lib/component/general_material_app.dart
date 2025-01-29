import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:general_app_package/notifier/combined_notifier.dart';
import 'package:general_app_package/notifier/locale_notifier.dart';
import 'package:general_app_package/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

Widget generalMaterialApp({required String title, required Widget home}) {
  return ChangeNotifierProvider(
    create: (context) => CombinedNotifier(
      [
        ThemeNotifier(),
        LocaleNotifier(),
      ],
    ),
    child: Consumer<CombinedNotifier>(builder: (context, notifier, child) {
      return MaterialApp(
        title: title,
        themeMode: notifier.themeNotifier!.themeMode,
        theme: notifier.themeNotifier!.lightTheme,
        darkTheme: notifier.themeNotifier!.darkTheme,
        locale: notifier.localeNotifier!.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: home,
      );
    }),
  );
}
