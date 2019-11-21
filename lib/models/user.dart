import 'package:json_annotation/json_annotation.dart';

part 'generated/user.g.dart';

@JsonSerializable()
class User {
  int id;
  String username;
  String full_name;
  String email;
  String address;

  User(this.id, this.username, this.full_name, this.email, this.address);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is User && other.id == id;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}