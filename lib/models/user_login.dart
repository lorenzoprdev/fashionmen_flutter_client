import 'package:json_annotation/json_annotation.dart';

part 'generated/user_login.g.dart';

@JsonSerializable()
class LoginModel {
  String username;
  String password;

  LoginModel(this.username, this.password);

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$UserLoginFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginToJson(this);
}