import 'package:fashionmen_flutter_client/providers/app_lang.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLang appLang = Provider.of<AppLang>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('overall.settings')),
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Theme(
        data: Theme.of(context).copyWith(
          brightness: Brightness.dark,
          canvasColor: Theme.of(context).primaryColor
        ),
        child: ListView(
          children: [
            ListTile(
              title: Text(AppLocalizations.of(context).translate('overall.language'),
                style: TextStyle(color: Colors.white)),
              trailing: DropdownButton(
                value: appLang.appLocale.languageCode,
                style: TextStyle(color: Colors.white),
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
                onChanged: (selected) => appLang.changeLanguage(Locale(selected)),
              ),
            )
          ]
        ),
      )
    );
  }
}