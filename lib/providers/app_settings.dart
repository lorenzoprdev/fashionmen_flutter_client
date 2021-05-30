import 'dart:ui';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:fashionmen_flutter_client/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_device_locale/flutter_device_locale.dart';
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
    String prefsLocale = prefs.getString('language_code');
    if(prefsLocale == null)
      _locale = Locale.fromSubtags(languageCode: 'es');
    else
      _locale = Locale(prefsLocale);

    if(!AppLocale.isSupported(_locale))
      _locale = Locale('en');

    AppTheme activeTheme = EnumToString.fromString(AppTheme.values, prefs.getString('theme'))
        ?? AppTheme.DARK;
    _theme = AppThemes.getTheme(activeTheme);
  }

  void changeLanguage(Locale locale) async {
    if(!AppLocale.isSupported(locale))
      return;
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
    await prefs.setString('country_code', locale.countryCode);
    _locale = locale;
    notifyListeners();
  }

  void changeTheme(AppTheme theme) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', EnumToString.parse(theme));
    _theme = AppThemes.getTheme(theme);
    notifyListeners();
  }
}