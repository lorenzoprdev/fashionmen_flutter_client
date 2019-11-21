// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegister _$UserRegisterFromJson(Map<String, dynamic> json) {
  return UserRegister(
    json['username'] as String,
    json['password'] as String,
    json['full_name'] as String,
    json['email'] as String,
    json['address'] as String,
  );
}

Map<String, dynamic> _$UserRegisterToJson(UserRegister instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'full_name': instance.full_name,
      'email': instance.email,
      'address': instance.address,
    };
