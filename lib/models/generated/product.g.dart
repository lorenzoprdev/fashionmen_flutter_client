// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    json['id'] as int,
    json['name'] as String,
    (json['price'] as num)?.toDouble(),
    json['image_url'] as String,
    json['product_type'] as String,
    json['description'] as String,
    json['sizes'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image_url': instance.image_url,
      'product_type': instance.product_type,
      'description': instance.description,
      'sizes': instance.sizes,
    };
