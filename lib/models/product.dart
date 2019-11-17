import 'package:flutter/foundation.dart';

@immutable
class Product {
  final int id;
  final String nombre;
  final double precio;
  final String img;
  final String tipoProducto;
  final String descripcion;
  final String tallas;
  final int likes;

  Product(this.id, this.nombre, this.precio, this.img, this.tipoProducto, this.descripcion, this.tallas, this.likes);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['id'],
      json['nombre'],
      json['precio'],
      json['img'],
      json['tipoProducto'],
      json['descripcion'],
      json['tallas'],
      json['likes'],
    );
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Product && other.id == id;
}