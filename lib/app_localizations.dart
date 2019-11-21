import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocale {
  final Locale locale;

  AppLocale(this.locale);

  static AppLocale of(BuildContext context) {
    return Localizations.of<AppLocale>(context, AppLocale);
  }

  static const LocalizationsDelegate<AppLocale> delegate = _AppLocalizationsDelegate();

  Map<String, dynamic> _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap;
    return true;
  }

  String translate(String key, [Map<String, dynamic> map]) {
    List<String> path = key.split('.');
    var map = _localizedStrings;
    var value;
    for(String segment in path) {
       value = map[segment];
      if(value != null && value.runtimeType != String)
        map = value;
      else
        break;
    }

    return value != null && value.runtimeType == String ? value : key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale localizations = new AppLocale(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocale> old) => false;
}