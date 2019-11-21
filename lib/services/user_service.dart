import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:fashionmen_flutter_client/models/user_logged_in.dart';
import 'package:fashionmen_flutter_client/models/user_login.dart';
import 'package:fashionmen_flutter_client/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static final UserService _userService = UserService._internal();

  UserLoggedIn _authData;

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

  String getProfileImageUrl() {
    if(_authData == null)
      return null;

    final hash = md5.convert(utf8.encode(_authData.user.email)).toString();
    return 'https://www.gravatar.com/avatar/$hash?s=200';
  }

  Future<User> login(LoginModel loginModel) async {
    final response = await http.post(
      'https://fashionmen.azurewebsites.net/api/users/login',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: jsonEncode(loginModel.toJson())
    );

    if(response.statusCode == 200) {
      this._authData = UserLoggedIn.fromJson(json.decode(response.body));
      return _authData.user;
    } else {
      return null;
    }
  }

  void logout() {
    _authData = null;
  }
}