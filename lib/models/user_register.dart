import 'package:json_annotation/json_annotation.dart';

part 'generated/user_register.g.dart';

@JsonSerializable()
class UserRegister {
  String username;
  String password;
  String full_name;
  String email;
  String address;

  UserRegister(this.username, this.password, this.full_name, this.email,
      this.address);

  factory UserRegister.fromJson(Map<String, dynamic> json) => _$UserRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterToJson(this);
}