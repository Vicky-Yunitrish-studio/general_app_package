import 'package:flutter/material.dart';
import 'package:general_app_package/component/locale_kit.dart';
import 'package:general_app_package/component/theme_kit.dart';
import 'package:general_app_package/notifier/combined_notifier.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(appLocalizations?.title_main ?? 'Main'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (appLocalizations != null) ...[
              Text(Provider.of<CombinedNotifier>(context)
                  .localeNotifier!
                  .locale
                  .toString()),
              languageKit(context, Provider.of<CombinedNotifier>(context)),
              darkLightToogleKit(
                  context, Provider.of<CombinedNotifier>(context)),
              darkThemeKit(context, Provider.of<CombinedNotifier>(context),
                  darkThemesDefaultMap),
              lightThemeKit(context, Provider.of<CombinedNotifier>(context),
                  lightThemesDefaultMap),
              themeKit(context, Provider.of<CombinedNotifier>(context),
                  darkThemesDefaultMap, lightThemesDefaultMap),
            ],
          ],
        ),
      ),
    );
  }
}
