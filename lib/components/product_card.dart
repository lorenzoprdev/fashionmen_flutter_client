import 'package:fashionmen_flutter_client/app_localizations.dart';
import 'package:fashionmen_flutter_client/models/product.dart';
import 'package:fashionmen_flutter_client/providers/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  final Product _product;

  ProductCard(this._product);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppSettings.of(context).theme.background,
      borderRadius: BorderRadius.circular(8),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: _product);
        },
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
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: _product.image_url,
                    fit: BoxFit.cover,
                    height: 170,
                    width: 170,
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                            _product.name,
                          overflow: TextOverflow.ellipsis,
                        )
                      ),
                    ),
                    Text(AppLocale.of(context).translate('overall.money', {'amount': _product.price.toString()}),
                      style: Theme.of(context).textTheme.caption
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
