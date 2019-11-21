import 'package:json_annotation/json_annotation.dart';

part 'generated/product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String name;
  double price;
  String image_url;
  String product_type;
  String description;
  String sizes;

  Product(this.id, this.name, this.price, this.image_url, this.product_type, this.description, this.sizes);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Product && other.id == id;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}