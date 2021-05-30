import 'package:fashionmen_flutter_client/components/product_card.dart';
import 'package:fashionmen_flutter_client/models/product.dart';
import 'package:fashionmen_flutter_client/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductList extends StatefulWidget {
  final String searchCriteria;

  ProductList({Key key, @required this.searchCriteria});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductService _productService = ProductService();

  List<Widget> _getProductCards(List<Product> products) {
    if(widget.searchCriteria != null)
      return products.where((pr) => pr.name.contains(widget.searchCriteria)).map((p) => ProductCard(p)).toList();
    else
      return products.map((p) => ProductCard(p)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Container(
        constraints: BoxConstraints(maxWidth: 600),
        child: FutureBuilder<List<Product>>(
          future: _productService.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return StaggeredGridView.count(
                crossAxisCount: 2,
                children: _getProductCards(snapshot.data),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                padding: EdgeInsets.all(8),
                staggeredTiles: snapshot.data.map((_) => StaggeredTile.fit(1)).toList(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}