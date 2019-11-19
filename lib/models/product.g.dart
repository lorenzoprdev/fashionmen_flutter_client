// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    json['id'] as int,
    json['nombre'] as String,
    (json['precio'] as num)?.toDouble(),
    json['img'] as String,
    json['tipoProducto'] as String,
    json['descripcion'] as String,
    json['tallas'] as String,
    json['likes'] as int,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'precio': instance.precio,
      'img': instance.img,
      'tipoProducto': instance.tipoProducto,
      'descripcion': instance.descripcion,
      'tallas': instance.tallas,
      'likes': instance.likes,
    };
