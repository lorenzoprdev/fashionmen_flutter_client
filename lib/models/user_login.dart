import 'package:json_annotation/json_annotation.dart';

part 'generated/user_login.g.dart';

@JsonSerializable()
class UserLogin {
  String username;
  String password;

  UserLogin(this.username, this.password);

  factory UserLogin.fromJson(Map<String, dynamic> json) => _$UserLoginFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginToJson(this);
}