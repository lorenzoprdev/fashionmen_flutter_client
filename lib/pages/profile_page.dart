import 'package:fashionmen_flutter_client/models/user.dart';
import 'package:fashionmen_flutter_client/services/user_service.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final void Function() onLoginCancelled;

  const ProfilePage({Key key, this.onLoginCancelled}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserService _userService = UserService();
  User _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = _userService.getUser();
    if(_currentUser == null) {
      _loginAndCheck();
    }
  }

  void _loginAndCheck() {
    Future(() async {
      dynamic successfulLogin = await Navigator.of(context).pushNamed('/login');
      print("#### " + successfulLogin.toString());
      if(successfulLogin == null || !successfulLogin) {
        widget.onLoginCancelled();
      } else {
        setState(() {
          _currentUser = _userService.getUser();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_currentUser == null)
      return Center(child: CircularProgressIndicator());
    return Column(
      children: <Widget>[
        Text(_currentUser.nombre_usuario)
      ],
    );
  }
}