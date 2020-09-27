import 'package:fashionmen_flutter_client/providers/app_settings.dart';
import 'file:///C:/Users/TheL0w3R/Development/flutter/fashionmen_flutter_client/lib/dialogs/language_selection_dialog.dart';
import 'package:fashionmen_flutter_client/themes.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

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
      body: SettingsList(
        backgroundColor: settings.theme.getPageBackground(),
        sections: [
          SettingsSection(
            title: AppLocale.of(context).translate('overall.appearance'),
            tiles: [
              SettingsTile(
                title: AppLocale.of(context).translate('overall.language'),
                subtitle: settings.locale.languageCode == 'es' ? 'Español' : 'English',
                leading: Icon(Icons.language),
                onTap: () async {
                  String locale = await Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true,
                      builder: (BuildContext context) => LanguageSelectionDialog()));

                  settings.changeLanguage(Locale(locale));
                },
              ),
              SettingsTile.switchTile(
                  title: AppLocale.of(context).translate('overall.dark_theme'),
                  leading: Icon(Icons.brightness_6),
                  onToggle: (val) => settings.changeTheme(val ? AppTheme.DARK : AppTheme.LIGHT),
                  switchValue: settings.theme.themeType == AppTheme.DARK,
                  switchActiveColor: settings.theme.nativeTheme.accentColor,
              )
            ],
          )
        ],
      )
    );
  }
}
