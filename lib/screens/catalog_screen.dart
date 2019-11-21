import 'package:fashionmen_flutter_client/components/main_drawer.dart';
import 'package:fashionmen_flutter_client/components/search_bar.dart';
import 'package:fashionmen_flutter_client/components/product_list.dart';
import 'package:fashionmen_flutter_client/services/product_service.dart';
import 'package:fashionmen_flutter_client/services/user_service.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final productService = ProductService();
  final userService = UserService();

  bool _searchEnabled = false;
  String _searchCriteria;

  AppBar _getAppBar() {
    if(_searchEnabled)
      return AppBar(
        title: SearchBar(
          onTextChange: (text) {
            setState(() {
              _searchCriteria = text;
            });
          },
          onClose: () {
            setState(() {
              _searchEnabled = false;
              _searchCriteria = null;
            });
          },
        ),
      );
    else
      return AppBar(
        title: Text("Fashion Men"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _searchEnabled = true;
              });
            },
          )
        ]
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: ProductList(searchCriteria: _searchCriteria),
      drawer: !_searchEnabled ? MainDrawer() : null,
    );
  }
}

