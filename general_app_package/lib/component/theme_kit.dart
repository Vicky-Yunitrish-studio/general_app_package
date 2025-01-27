import 'package:flutter/material.dart';
import 'package:general_app_package/component/general_kit.dart';
import 'package:general_app_package/component/theme_sets.dart';
import 'package:general_app_package/notifier/combined_notifier.dart';
import 'package:provider/provider.dart';

List<ThemeDataTween> themesDefault = [
  Themes.grey,
  Themes.blue,
  Themes.brown,
];
List<String> themesDefaultNames = ["Grey", "Blue", "Brown"];

int getCurrentThemeIndex(
    List<ThemeDataTween> themes, CombinedNotifier notifier) {
  int index = themes.indexOf(notifier.themeNotifier!.colorTheme);
  return index >= 0 ? index : 0;
}

Widget darkThemeKit(BuildContext context, CombinedNotifier notifier) {
  return kit(
    context,
    const Icon(Icons.color_lens_outlined),
    DropdownButton(
        value: notifier.themeNotifier!.colorTheme,
        items: [
          DropdownMenuItem(value: Themes.grey, child: const Text("#Grey")),
          DropdownMenuItem(value: Themes.blue, child: const Text("#Blue")),
          DropdownMenuItem(value: Themes.brown, child: const Text("#Brown")),
        ],
        onChanged: (value) {
          ThemeDataTween theme = value as ThemeDataTween;

          Provider.of<CombinedNotifier>(context, listen: false)
              .themeNotifier!
              .updateDarkTheme(theme.end as ThemeData);
        }),
  );
}

Widget lightThemeKit(BuildContext context, CombinedNotifier notifier) {
  return kit(
    context,
    const Icon(Icons.color_lens_outlined),
    DropdownButton(
        value: notifier.themeNotifier!.colorTheme,
        items: [
          DropdownMenuItem(value: Themes.grey, child: const Text("#Grey")),
          DropdownMenuItem(value: Themes.blue, child: const Text("#Blue")),
          DropdownMenuItem(value: Themes.brown, child: const Text("#Brown")),
        ],
        onChanged: (value) {
          ThemeDataTween theme = value as ThemeDataTween;

          Provider.of<CombinedNotifier>(context, listen: false)
              .themeNotifier!
              .updateLightTheme(theme.begin as ThemeData);
        }),
  );
}

Widget themeKit(BuildContext context, CombinedNotifier notifier,
    List<ThemeDataTween> themes, List<String> themeNames) {
  return kit(
    context,
    const Icon(Icons.color_lens_outlined),
    DropdownButton<String>(
      value: themeNames[getCurrentThemeIndex(themes, notifier)],
      items: themeNames.map(
        (name) {
          return DropdownMenuItem(
            value: name,
            child: Text(name),
          );
        },
      ).toList(),
      onChanged: (value) {
        if (value != null) {
          int index = themeNames.indexOf(value);
          if (index != -1) {
            Provider.of<CombinedNotifier>(context, listen: false)
                .themeNotifier!
                .setTheme(themes[index]);
          }
          debugPrint("Theme: ${notifier.themeNotifier!.colorTheme}");
        }
      },
    ),
  );
}
