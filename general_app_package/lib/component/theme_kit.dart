import 'package:flutter/material.dart';
import 'package:general_app_package/component/general_kit.dart';
import 'package:general_app_package/component/theme_sets.dart';
import 'package:general_app_package/notifier/combined_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Map<ThemeDataTween, String> themesDefaultMap = {
  Themes.grey: "Grey",
  Themes.blue: "Blue",
  Themes.brown: "Brown",
};

Map<ThemeData, String> darkThemesDefaultMap = {
  Themes.grey.end as ThemeData: "Grey",
  Themes.blue.end as ThemeData: "Blue",
  Themes.brown.end as ThemeData: "Brown",
};

Map<ThemeData, String> lightThemesDefaultMap = {
  Themes.grey.begin as ThemeData: "Grey",
  Themes.blue.begin as ThemeData: "Blue",
  Themes.brown.begin as ThemeData: "Brown",
};

int getCurrentLightThemeIndex(
    Map<ThemeData, String> themes, CombinedNotifier notifier) {
  final index =
      themes.keys.toList().indexOf(notifier.themeNotifier!.lightTheme);
  return index >= 0 ? index : 0;
}

int getCurrentDarkThemeIndex(
    Map<ThemeData, String> themes, CombinedNotifier notifier) {
  final index = themes.keys.toList().indexOf(notifier.themeNotifier!.darkTheme);
  return index >= 0 ? index : 0;
}

Widget darkThemeKit(BuildContext context, CombinedNotifier notifier,
    Map<ThemeData, String> themes) {
  var themesList = themes.keys.toList();
  var namesList = themes.values.toList();

  return kit(
    context,
    const Row(
      children: [
        Icon(Icons.color_lens_outlined),
        SizedBox(width: 5),
        Icon(Icons.dark_mode_rounded),
      ],
    ),
    DropdownButton(
        value: namesList[getCurrentDarkThemeIndex(themes, notifier)],
        items: namesList.map(
          (name) {
            return DropdownMenuItem(
              value: name,
              child: Text(name),
            );
          },
        ).toList(),
        onChanged: (value) {
          if (value != null) {
            int index = namesList.indexOf(value);
            if (index != -1) {
              Provider.of<CombinedNotifier>(context, listen: false)
                  .themeNotifier!
                  .updateDarkTheme(themesList[index]);
            }
          }
        }),
  );
}

Widget lightThemeKit(BuildContext context, CombinedNotifier notifier,
    Map<ThemeData, String> themes) {
  var themesList = themes.keys.toList();
  var namesList = themes.values.toList();

  return kit(
    context,
    const Row(
      children: [
        Icon(Icons.color_lens_outlined),
        SizedBox(width: 10),
        Icon(Icons.light_mode_rounded),
      ],
    ),
    DropdownButton(
        value: namesList[getCurrentLightThemeIndex(themes, notifier)],
        items: namesList.map(
          (name) {
            return DropdownMenuItem(
              value: name,
              child: Text(name),
            );
          },
        ).toList(),
        onChanged: (value) {
          if (value != null) {
            int index = namesList.indexOf(value);
            if (index != -1) {
              Provider.of<CombinedNotifier>(context, listen: false)
                  .themeNotifier!
                  .updateLightTheme(themesList[index]);
            }
          }
        }),
  );
}

Widget themeKit(BuildContext context, CombinedNotifier notifier,
    Map<ThemeData, String> darkThemes, Map<ThemeData, String> lightThemes) {
  if (notifier.themeNotifier!.themeMode == ThemeMode.dark) {
    return darkThemeKit(context, notifier, darkThemes);
  } else {
    return lightThemeKit(context, notifier, lightThemes);
  }
}

Widget darkLightToogleKit(BuildContext context, CombinedNotifier notifier) {
  return kit(
    context,
    const Icon(Icons.color_lens_outlined),
    DropdownButton(
      value: notifier.themeNotifier!.themeMode,
      items: [
        DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text(AppLocalizations.of(context)!.dark)),
        DropdownMenuItem(
            value: ThemeMode.light,
            child: Text(AppLocalizations.of(context)!.light)),
        DropdownMenuItem(
            value: ThemeMode.system,
            child: Text(AppLocalizations.of(context)!.system)),
      ],
      onChanged: (value) =>
          Provider.of<CombinedNotifier>(context, listen: false)
              .themeNotifier!
              .toogleTheme(value as ThemeMode),
    ),
  );
}
