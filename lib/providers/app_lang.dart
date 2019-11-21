import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLang extends ChangeNotifier {
  Locale _appLocale;

  Locale get appLocale => _appLocale;

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    String langCode = prefs.getString('language_code');
    if (langCode == null) {
      changeLanguage(Locale(window.locale.languageCode));
      return Null;
    }
    _appLocale = Locale(langCode);
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', type.languageCode);
    await prefs.setString('country_code', type.countryCode);
    _appLocale = type;
    notifyListeners();
  }
}