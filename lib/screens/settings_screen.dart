import 'package:fashionmen_flutter_client/providers/app_settings.dart';
import 'package:fashionmen_flutter_client/themes.dart';
import 'package:flutter/material.dart';

import '../app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSettings settings = AppSettings.of(context);
    return Scaffold(
      appBar: AppBar(
        title:
          Text(AppLocale.of(context).translate('overall.settings')),
      ),
      backgroundColor: settings.theme.getPageBackground(),
      body: ListView(children: [
        ListTile(
          title: Text(
              AppLocale.of(context).translate('overall.language')),
          trailing: DropdownButton(
            value: settings.locale.languageCode,
            items: [
              DropdownMenuItem(
                value: 'es',
                child: Text("Español"),
              ),
              DropdownMenuItem(
                value: 'en',
                child: Text("English"),
              )
            ],
            onChanged: (selected) => settings.changeLanguage(Locale(selected)),
          ),
        ),
        ListTile(
          title: Text(AppLocale.of(context).translate("overall.theme")),
          trailing: DropdownButton<AppTheme>(
            value: settings.theme.themeType,
            items: [
              DropdownMenuItem(
                value: AppTheme.LIGHT,
                child: Text(AppLocale.of(context).translate('themes.light')),
              ),
              DropdownMenuItem(
                value: AppTheme.DARK,
                child: Text(AppLocale.of(context).translate('themes.dark')),
              )
            ],
            onChanged: (selected) => settings.changeTheme(selected),
          ),
        )
      ])
    );
  }
}
