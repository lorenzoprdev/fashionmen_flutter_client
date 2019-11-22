import 'package:fashionmen_flutter_client/app_localizations.dart';
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(children: <Widget>[
              Hero(
                tag: product.image_url,
                child: ClipRect(child: Image.network(product.image_url))
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(product.description,
                      style: Theme.of(context).textTheme.body1)
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('${AppLocale.of(context).translate('overall.selected_size')}:'),
                        SizeSelector(sizes: sizes),
                      ],
                    ),
                  ),
                ]),
              ),
            ],),
          ),
          Container(
            padding: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, -3),
                  blurRadius: 6
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                      AppLocale.of(context).translate('overall.money', {'amount': product.price.toString()}),
                    style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton.icon(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        color: Theme.of(context).accentColor,
                        colorBrightness: Theme.of(context).accentColorBrightness,
                        icon: Icon(Icons.shopping_basket),
                        label: Text(AppLocale.of(context).translate('overall.buy')),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: FlatButton.icon(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        color: Theme.of(context).primaryColorDark,
                        colorBrightness: Theme.of(context).primaryColorBrightness,
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text(AppLocale.of(context).translate('overall.add_to_cart')),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}


