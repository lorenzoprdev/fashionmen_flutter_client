import 'dart:convert';
import 'dart:io';

import 'package:fashionmen_flutter_client/models/auth_data.dart';
import 'package:fashionmen_flutter_client/models/login_model.dart';
import 'package:fashionmen_flutter_client/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static final UserService _userService = UserService._internal();

  AuthData _authData;

  factory UserService() {
    return _userService;
  }

  UserService._internal();

  User getUser() {
    if(_authData != null)
      return _authData.user;
    else
      return null;
  }

  Future<User> login(LoginModel loginModel) async {
    final response = await http.post(
      'https://fashionmen.azurewebsites.net/api/usuarios/login',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: jsonEncode(loginModel.toJson())
    );

    if(response.statusCode == 200) {
      this._authData = AuthData.fromJson(json.decode(response.body));
      return _authData.user;
    } else {
      return null;
    }
  }

  void logout() {
    _authData = null;
  }
}