import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String nombre;
  double precio;
  String img;
  String tipoProducto;
  String descripcion;
  String tallas;
  int likes;

  Product(this.id, this.nombre, this.precio, this.img, this.tipoProducto, this.descripcion, this.tallas, this.likes);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Product && other.id == id;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}