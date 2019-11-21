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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: _product.image_url,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    _product.image_url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text(_product.name),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
