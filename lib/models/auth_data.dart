import 'package:json_annotation/json_annotation.dart';
import 'package:fashionmen_flutter_client/models/user.dart';

part 'generated/auth_data.g.dart';

@JsonSerializable()
class AuthData {
  User user;
  String accessToken;

  AuthData(this.user, this.accessToken);

  factory AuthData.fromJson(Map<String, dynamic> json) => _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}