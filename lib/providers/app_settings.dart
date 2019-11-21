import 'dart:ui';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themes.dart';

class AppSettings extends ChangeNotifier {
  Locale _locale;
  AppThemeData _theme;

  Locale get locale => _locale;
  AppThemeData get theme => _theme;

  static AppSettings of(BuildContext context) => Provider.of<AppSettings>(context);

  Future fetchData() async {
    var prefs = await SharedPreferences.getInstance();
    String langCode = prefs.getString('language_code') ?? Locale(window.locale.languageCode);
    AppTheme activeTheme = EnumToString.fromString(AppTheme.values, prefs.getString('theme'))
        ?? AppTheme.DARK;
    _locale = Locale(langCode);
    _theme = AppThemes.getTheme(activeTheme);
    return;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', type.languageCode);
    await prefs.setString('country_code', type.countryCode);
    _locale = type;
    notifyListeners();
  }

  void changeTheme(AppTheme theme) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', EnumToString.parse(theme));
    _theme = AppThemes.getTheme(theme);
    notifyListeners();
  }
}