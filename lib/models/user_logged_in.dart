import 'package:json_annotation/json_annotation.dart';
import 'package:fashionmen_flutter_client/models/user.dart';

part 'generated/user_logged_in.g.dart';

@JsonSerializable()
class UserLoggedIn {
  User user;
  String accessToken;

  UserLoggedIn(this.user, this.accessToken);

  factory UserLoggedIn.fromJson(Map<String, dynamic> json) => _$UserLoggedInFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoggedInToJson(this);
}