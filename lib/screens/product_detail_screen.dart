import 'package:fashionmen_flutter_client/components/size_selector.dart';
import 'package:fashionmen_flutter_client/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    final sizes = product.sizes.split(',');

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(children: <Widget>[
        Hero(
          tag: product.image_url,
          child: ClipRect(child: Image.network(product.image_url))
        ),
        Column(children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Tallas',
              style: Theme.of(context).textTheme.subhead
                  .copyWith(color: Colors.white))
          ),
          SizeSelector(sizes: sizes),
        ],),
      ],)
    );
  }
}


