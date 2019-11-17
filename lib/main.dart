import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:fashionmen_flutter_client/pages/login_page.dart';
import 'package:fashionmen_flutter_client/pages/product_detail_page.dart';
import 'package:fashionmen_flutter_client/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
          routes: {
            '/': (context) => ProductsPage(),
            '/detail': (context) => ProductDetailPage(),
            '/login': (context) => LoginPage()
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
