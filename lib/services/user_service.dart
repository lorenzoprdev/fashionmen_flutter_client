import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:fashionmen_flutter_client/models/user_logged_in.dart';
import 'package:fashionmen_flutter_client/models/user_login.dart';
import 'package:fashionmen_flutter_client/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static final UserService _userService = UserService._internal();

  UserLoggedIn _authData;

  factory UserService() {
    return _userService;
  }

  UserService._internal();

  Future<User> getUser() async {
    if(_authData != null)
      return _authData.user;

    await _readUserFromCache();

    if(_authData != null)
      return _authData.user;

    return null;
  }

  String getProfileImageUrl() {
    if(_authData == null)
      return null;

    final hash = md5.convert(utf8.encode(_authData.user.email)).toString();
    return 'https://www.gravatar.com/avatar/$hash?s=200';
  }

  Future<User> login(UserLogin loginModel) async {
    final response = await http.post(
      'https://fashionmen.azurewebsites.net/api/users/login',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: jsonEncode(loginModel.toJson())
    );

    if(response.statusCode == 200) {
      _authData = UserLoggedIn.fromJson(json.decode(response.body));
      await _saveUserInCache(_authData);
      return _authData.user;
    } else {
      return null;
    }
  }

  void logout() async {
    _authData = null;
    await _removeUserInCache();
  }

  Future _saveUserInCache(UserLoggedIn data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('authData', json.encode(_authData.toJson()));
  }

  Future _removeUserInCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('authData');
  }

  Future _readUserFromCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userDataJson = sharedPreferences.getString('authData');
    if(userDataJson != null)
      _authData = UserLoggedIn.fromJson(json.decode(userDataJson));
  }
}