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
      body: Column(
        children: <Widget>[
          ClipRect(child: Image.network(product.img)),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Tallas',style: Theme.of(context).textTheme.subhead)),
              SizeSelector(sizes: sizes),
            ],
          ),],
      )
    );
  }
}

class SizeSelector extends StatefulWidget {
  final List<String> sizes;

  SizeSelector({ this.sizes });

  @override
  State<StatefulWidget> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String _currentSize;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: (_currentSize == null ? _currentSize = widget.sizes[0] : _currentSize),
      items: [
        for (String size in widget.sizes)
          DropdownMenuItem(
            value: size,
            child: Text(size),
          )
      ],
      onChanged: (selected) {
        setState(() {
          _currentSize = selected;
        });
      },
    );
  }
}
