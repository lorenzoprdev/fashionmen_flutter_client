import 'package:fashionmen_flutter_client/app_localizations.dart';
import 'package:fashionmen_flutter_client/components/form_errors.dart';
import 'package:fashionmen_flutter_client/components/custom_text_field.dart';
import 'package:fashionmen_flutter_client/models/user_login.dart';
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

  Future _login() async {
    setState(() {
      _busy = true;
    });
    User user = await _userService
        .login(UserLogin(usernameController.text, passwordController.text));
    if (user != null) {
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
  }

  Widget _buildLoginUI() {
    if (_busy) {
      return Center(child: CircularProgressIndicator());
    }
    return Center(
      heightFactor: 1,
      child: Container(
        constraints: BoxConstraints(maxWidth: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: SvgPicture.asset(
                            'assets/icons/fashion_men_icon_no_padding.svg', height: 200,),
                      ),
                      Column(
                        children: <Widget>[
                          CustomTextField(
                            textController: usernameController,
                            icon: Icons.person,
                            hintText:
                                AppLocale.of(context).translate("overall.username"),
                            obscureText: false,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: CustomTextField(
                              textController: passwordController,
                              icon: Icons.lock,
                              hintText: AppLocale.of(context)
                                  .translate("overall.password"),
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                      if (_loginErrors)
                        FormErrors(
                          child: Text(
                            AppLocale.of(context).translate("overall.login_errors"),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      FlatButton(
                        child: Text(AppLocale.of(context).translate("overall.create_account")),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Text(AppLocale.of(context).translate("overall.login")),
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Theme.of(context).accentColor,
              colorBrightness: Theme.of(context).accentColorBrightness,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              onPressed: () async => await _login(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocale.of(context).translate("overall.login")),
        ),
        body: _buildLoginUI());
  }
}
