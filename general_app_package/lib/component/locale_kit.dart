import 'package:flutter/material.dart';
import 'package:general_app_package/component/general_kit.dart';
import 'package:general_app_package/notifier/combined_notifier.dart';
import 'package:provider/provider.dart';

Widget languageKit(BuildContext context, CombinedNotifier notifier) {
  return kit(
    context,
    const Icon(Icons.language),
    DropdownButton(
      value: notifier.localeNotifier!.locale,
      items: const [
        DropdownMenuItem(value: Locale("en", "US"), child: Text("English")),
        DropdownMenuItem(value: Locale("zh", "TW"), child: Text("繁體中文")),
      ],
      onChanged: (value) =>
          Provider.of<CombinedNotifier>(context, listen: false)
              .localeNotifier!
              .updateLocale(value as Locale),
    ),
  );
}
