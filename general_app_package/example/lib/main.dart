import 'package:example/main_page.dart';
import 'package:flutter/material.dart';
import 'package:general_app_package/notifier/combined_notifier.dart';
import 'package:general_app_package/notifier/locale_notifier.dart';
import 'package:general_app_package/notifier/theme_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CombinedNotifier(
        [
          ThemeNotifier(),
          LocaleNotifier(),
        ],
      ),
      child: Consumer(builder: (context, CombinedNotifier notifier, child) {
        return MaterialApp(
          title: 'General App Package Example',
          theme: notifier.themeNotifier!.colorTheme.begin,
          darkTheme: notifier.themeNotifier!.colorTheme.end,
          locale: notifier.localeNotifier!.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: const MainPage(),
        );
      }),
    );
  }
}
