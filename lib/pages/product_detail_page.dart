import 'package:fashionmen_flutter_client/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    final sizes = product.tallas.split(',');

    return Scaffold(
      appBar: AppBar(
        title: Text(product.nombre),
      ),
      body: Column(
        children: <Widget>[
          ClipRect(child: Image.network(product.img)),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Tallas',style: Theme.of(context).textTheme.subhead)),
              SizeSelector(sizes),
            ],
          ),],
      )
    );
  }
}

class SizeSelector extends StatefulWidget {
  List<String> _sizes;
  String _currentSize;

  SizeSelector(this._sizes) {
    _currentSize = _sizes[0];
  }

  @override
  State<StatefulWidget> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget._currentSize,
      items: [
        for (String size in widget._sizes)
          DropdownMenuItem(
            value: size,
            child: Text(size),
          )
      ],
      onChanged: (selected) {
        setState(() {
          widget._currentSize = selected;
        });
      },
    );
  }
}
