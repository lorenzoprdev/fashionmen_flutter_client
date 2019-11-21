import 'package:fashionmen_flutter_client/app_localizations.dart';
import 'package:fashionmen_flutter_client/providers/app_lang.dart';
import 'package:fashionmen_flutter_client/screens/profile_screen.dart';
import 'package:fashionmen_flutter_client/screens/login_screen.dart';
import 'package:fashionmen_flutter_client/screens/product_detail_screen.dart';
import 'package:fashionmen_flutter_client/screens/catalog_screen.dart';
import 'package:fashionmen_flutter_client/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'util.dart' as util;

void main() async {
  AppLang appLang = AppLang();
  await appLang.fetchLocale();
  runApp(new FashionMenApp(
    appLang: appLang
  ));
}

class FashionMenApp extends StatelessWidget {
  final AppLang appLang;

  FashionMenApp({this.appLang});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
      )
    );
    return ChangeNotifierProvider<AppLang>(
      builder: (_) => appLang,
      child: Consumer<AppLang>(
        builder: (context, model, child) {
          return MaterialApp(
            title: 'Fashion Men',
            theme: new ThemeData(
                primaryColor: util.hexToColor('#333333'),
                primaryColorLight: util.hexToColor('#5c5c5c'),
                primaryColorDark: util.hexToColor('#0c0c0c'),
                accentColor: util.hexToColor("#ffee58"),
                brightness: Brightness.light
            ),
            locale: model.appLocale,
            supportedLocales: [
              Locale('en', 'US'),
              Locale('es', 'ES')
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case '/':
                  return MaterialPageRoute(
                    builder: (context) => CatalogScreen(),
                  );
                  break;
                case '/detail':
                  return MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(),
                      settings: settings
                  );
                  break;
                case '/login':
                  return MaterialPageRoute<bool>(
                      builder: (context) => LoginScreen(),
                      fullscreenDialog: true
                  );
                  break;
                case '/profile':
                  return MaterialPageRoute(
                      builder: (context) => ProfileScreen()
                  );
                  break;
                case '/settings':
                  return MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  );
                  break;
              }
              return null;
            },
            debugShowCheckedModeBanner: false,
          );
        },
      )
    );
  }
}
