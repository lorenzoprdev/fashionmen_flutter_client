import 'package:fashionmen_flutter_client/models/login_model.dart';
import 'package:fashionmen_flutter_client/models/user.dart';
import 'package:fashionmen_flutter_client/services/user_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserService _userService = UserService();

  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Nombre de usuario"
              ),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Contraseña",
              ),
            ),
            RaisedButton(
              child: Text("Login"),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              onPressed: () async {
                User user = await _userService.login(LoginModel(usernameController.text, passwordController.text));
                if(user != null) {
                  Navigator.pop(context, true);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
