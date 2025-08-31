import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/app.dart';

class LanguageChangeSwitch extends StatelessWidget {
  const LanguageChangeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // title: Text(context.localization.selectLanguage.toString()),
      title: Text('Select Language'),
      trailing: DropdownMenu<Locale>(
        dropdownMenuEntries:
            CraftyBay.languageController.supportedLocales.map((locale) {
              return DropdownMenuEntry(
                value: locale,
                label: locale.languageCode,
              );
            }).toList(),
        onSelected: (Locale? locale) {
          CraftyBay.languageController.changeLocale(locale!);
        },
      ),
    );
  }
}
