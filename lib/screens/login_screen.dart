import 'package:fashionmen_flutter_client/app_localizations.dart';
import 'package:fashionmen_flutter_client/components/custom_text_field.dart';
import 'package:fashionmen_flutter_client/models/login_model.dart';
import 'package:fashionmen_flutter_client/models/user.dart';
import 'package:fashionmen_flutter_client/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserService _userService = UserService();

  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  bool _busy = false;
  bool _loginErrors = false;

  Widget _buildLoginUI() {
    if(_busy) {
      return Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SvgPicture.asset(
                  'assets/icons/fashion_men_icon_no_padding.svg'
              ),
            ),
            Column(
              children: <Widget>[
                CustomTextField(
                  textController: usernameController,
                  icon: Icons.person,
                  hintText: AppLocalizations.of(context).translate("overall.username"),
                  obscureText: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTextField(
                    textController: passwordController,
                    icon: Icons.lock,
                    hintText: AppLocalizations.of(context).translate("overall.password"),
                    obscureText: true,
                  ),
                ),
              ],
            ),
            if(_loginErrors)
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 7),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
                child: Text(AppLocalizations.of(context).translate("overall.login_errors"),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: (_loginErrors ? 0 : 40)),
              child: RaisedButton(
                child: Text(AppLocalizations.of(context).translate("overall.login")),
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                onPressed: () async {
                  setState(() {
                    _busy = true;
                  });
                  User user = await _userService.login(LoginModel(usernameController.text, passwordController.text));
                  if(user != null) {
                    _loginErrors = false;
                    Navigator.pop(context, true);
                  } else {
                    _loginErrors = true;
                    usernameController.clear();
                    passwordController.clear();
                  }
                  setState(() {
                    _busy = false;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("overall.login")),
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
      body: _buildLoginUI()
    );
  }
}
