// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['dni'] as String,
    json['nombre_usuario'] as String,
    json['passwd'] as String,
    json['nombre_completo'] as String,
    json['correo_electronico'] as String,
    json['fecha_nacimiento'] as String,
    json['direccion'] as String,
    json['pedidos'],
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'dni': instance.dni,
      'nombre_usuario': instance.nombre_usuario,
      'passwd': instance.passwd,
      'nombre_completo': instance.nombre_completo,
      'correo_electronico': instance.correo_electronico,
      'fecha_nacimiento': instance.fecha_nacimiento,
      'direccion': instance.direccion,
      'pedidos': instance.pedidos,
    };
