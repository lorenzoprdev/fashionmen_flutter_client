import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:fashionmen_flutter_client/screens/login_screen.dart';
import 'package:fashionmen_flutter_client/screens/product_detail_screen.dart';
import 'package:fashionmen_flutter_client/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new FashionMenApp());

class FashionMenApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
      )
    );
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.teal,
        brightness: brightness
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'Fashion Men',
          theme: theme,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (context) => MainScreen(),
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
            }
            return null;
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
