// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthData _$AuthDataFromJson(Map<String, dynamic> json) {
  return AuthData(
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['accessToken'] as String,
  );
}

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
    };
