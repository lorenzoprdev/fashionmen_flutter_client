import 'package:flutter/material.dart';
import 'util.dart' as util;

enum AppTheme {
  LIGHT, DARK
}

class AppThemes {
  static final AppThemeData lightTheme = AppThemeData(
    themeType: AppTheme.LIGHT,
    nativeTheme: ThemeData(
      brightness: Brightness.light,
      accentColorBrightness: Brightness.dark,
      primarySwatch: Colors.indigo,
      cursorColor: Colors.black54
    ),
    background: Colors.white,
    backgroundPrimary: Colors.indigo,
  );

  static final AppThemeData darkTheme = AppThemeData(
    themeType: AppTheme.DARK,
    nativeTheme: ThemeData(
      brightness: Brightness.dark,
      accentColorBrightness: Brightness.light,
      primaryColor: util.hexToColor('#333333'),
      primaryColorLight: util.hexToColor('#5c5c5c'),
      primaryColorDark: util.hexToColor('#0c0c0c'),
      accentColor: Colors.yellow.shade400,
      cursorColor: Colors.white70,
      backgroundColor: util.hexToColor('#5c5c5c'),
      canvasColor: util.hexToColor('#5c5c5c'),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.normal
      )
    ),
    background: util.hexToColor('#333333'),
    backgroundPrimary: util.hexToColor('#5c5c5c'),
  );

  static AppThemeData getTheme(AppTheme themeType) {
    switch(themeType) {
      case AppTheme.LIGHT:
        return lightTheme;
      case AppTheme.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}

class AppThemeData {
  final AppTheme themeType;
  final ThemeData nativeTheme;
  final Color background;
  final Color backgroundPrimary;

  AppThemeData({
    this.themeType,
    this.nativeTheme,
    this.background,
    this.backgroundPrimary
  });

  Color getPageBackground() =>
      nativeTheme.brightness == Brightness.dark ? backgroundPrimary : background;
}