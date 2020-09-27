import 'package:fashionmen_flutter_client/app_localizations.dart';
import 'package:fashionmen_flutter_client/providers/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

/**
 * Created by TheL0w3R on 27/09/2020.
 * All Rights Reserved.
 */
class LanguageSelectionDialog extends StatefulWidget {

  LanguageSelectionDialog({Key key}) : super(key: key);

  @override
  _LanguageSelectionDialogState createState() =>
      _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState extends State<LanguageSelectionDialog> {

  @override
  Widget build(BuildContext context) {
    AppSettings settings = AppSettings.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocale.of(context).translate("overall.language"))),
      body: SettingsList(
        backgroundColor: settings.theme.getPageBackground(),
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "English",
              trailing: trailingWidget(settings, "en"),
              onTap: () {
                changeLanguage("en");
              },
            ),
            SettingsTile(
              title: "Español",
              trailing: trailingWidget(settings, "es"),
              onTap: () {
                changeLanguage("es");
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget trailingWidget(AppSettings settings, String locale) {
    return (settings.locale.languageCode == locale)
        ? Icon(Icons.check, color: settings.theme.nativeTheme.accentColor)
        : Icon(null);
  }

  void changeLanguage(String locale) {
    Navigator.of(context).pop(locale);
  }
}