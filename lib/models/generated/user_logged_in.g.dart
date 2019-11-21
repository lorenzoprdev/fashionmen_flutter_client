// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_logged_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoggedIn _$UserLoggedInFromJson(Map<String, dynamic> json) {
  return UserLoggedIn(
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['accessToken'] as String,
  );
}

Map<String, dynamic> _$UserLoggedInToJson(UserLoggedIn instance) => <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
    };
