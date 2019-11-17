import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:fashionmen_flutter_client/components/product_card.dart';
import 'package:fashionmen_flutter_client/models/product.dart';
import 'package:fashionmen_flutter_client/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductsPage extends StatelessWidget {

  Brightness _getCurrentBrightness(BuildContext context) {
    DynamicThemeState theme = DynamicTheme.of(context);
    if(theme == null)
      return Brightness.dark;

    if(theme.brightness == Brightness.dark)
      return Brightness.light;
    else
      return Brightness.dark;
  }

  List<Widget> _getProductCards(List<Product> products) {
    return products.map((p) => ProductCard(p)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final productService = ProductService();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: _getCurrentBrightness(context)
        )
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Buscar',
                  hintText: 'Buscar...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: productService.getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      children: _getProductCards(snapshot.data)
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Carrito'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Catálogo'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Perfil'))
        ],
      ),
    );
  }
}
