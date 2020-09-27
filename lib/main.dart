import 'package:fashionmen_flutter_client/app_localizations.dart';
import 'package:fashionmen_flutter_client/providers/app_settings.dart';
import 'package:fashionmen_flutter_client/screens/profile_screen.dart';
import 'package:fashionmen_flutter_client/screens/login_screen.dart';
import 'package:fashionmen_flutter_client/screens/product_detail_screen.dart';
import 'package:fashionmen_flutter_client/screens/catalog_screen.dart';
import 'package:fashionmen_flutter_client/screens/register_screen.dart';
import 'package:fashionmen_flutter_client/screens/settings_screen.dart';
import 'package:fashionmen_flutter_client/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppSettings appSettings = AppSettings();
  await appSettings.fetchData();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(FashionMenApp(
    appSettings: appSettings
  ));
}

class FashionMenApp extends StatefulWidget {
  final AppSettings appSettings;

  FashionMenApp({this.appSettings});

  @override
  _FashionMenAppState createState() => _FashionMenAppState();
}

class _FashionMenAppState extends State<FashionMenApp> {

  @override
  void initState() {
    widget.appSettings.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Theme.of(context).brightness
      )
    );
    return ChangeNotifierProvider<AppSettings>(
      create: (_) => widget.appSettings,
      child: Consumer<AppSettings>(
        builder: (context, settings, child) {
          return MaterialApp(
            title: 'Fashion Men',
            theme: settings.theme.nativeTheme,
            locale: settings.locale,
            supportedLocales: [
              Locale('en', 'US'),
              Locale('es', 'ES')
            ],
            localizationsDelegates: [
              AppLocale.delegate,
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
                  );
                  break;
                case '/register':
                  return MaterialPageRoute<bool>(
                    builder: (context) => RegisterScreen(),
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
