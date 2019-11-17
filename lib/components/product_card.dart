import 'package:fashionmen_flutter_client/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product _product;

  ProductCard(this._product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: _product);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Image.network(
                _product.img,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              child: Center(
                child: Text(_product.nombre),
              ),
            )
          ],
        )
      ),
    );
  }
}
