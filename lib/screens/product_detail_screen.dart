import 'package:fashionmen_flutter_client/components/size_selector.dart';
import 'package:fashionmen_flutter_client/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    final sizes = product.tallas.split(',');

    return Scaffold(
      appBar: AppBar(
        title: Text(product.nombre),
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Column(children: <Widget>[
        Hero(
          tag: product.img,
          child: ClipRect(child: Image.network(product.img))
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


