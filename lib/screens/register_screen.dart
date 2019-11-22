import 'package:fashionmen_flutter_client/components/custom_text_field.dart';
import 'package:fashionmen_flutter_client/models/user.dart';
import 'package:fashionmen_flutter_client/models/user_register.dart';
import 'package:fashionmen_flutter_client/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_localizations.dart';
import '../components/form_errors.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final UserService _userService = UserService();

  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController fullNameController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  bool _busy = false;
  bool _registerError = false;

  Future _register() async {
    setState(() {
      _busy = true;
    });
    User user = await _userService.register(UserRegister(
      usernameController.text,
      passwordController.text,
      fullNameController.text,
      emailController.text,
      addressController.text
    ));
    if(user != null) {
      Navigator.pop(context, true);
    } else {
      _registerError = true;
      usernameController.clear();
      emailController.clear();
      fullNameController.clear();
      addressController.clear();
      passwordController.clear();
    }
    setState(() {
      _busy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_busy) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocale.of(context).translate("overall.new_account")),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocale.of(context).translate("overall.new_account")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: SvgPicture.asset(
                          'assets/icons/fashion_men_icon_no_padding.svg',
                        height: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CustomTextField(
                        icon: Icons.account_box,
                        hintText: AppLocale.of(context).translate('overall.username'),
                        textController: usernameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CustomTextField(
                        icon: Icons.email,
                        hintText: AppLocale.of(context).translate('overall.email'),
                        textController: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CustomTextField(
                        icon: Icons.person,
                        hintText: AppLocale.of(context).translate('overall.full_name'),
                        textController: fullNameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CustomTextField(
                        icon: Icons.location_on,
                        hintText: AppLocale.of(context).translate('overall.address'),
                        textController: addressController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CustomTextField(
                        icon: Icons.lock,
                        hintText: AppLocale.of(context).translate('overall.password'),
                        textController: passwordController,
                        obscureText: true,
                      ),
                    ),
                    if(_registerError)
                      FormErrors(
                        child: Text(
                          AppLocale.of(context).translate("overall.register_errors"),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Text(AppLocale.of(context).translate("overall.register")),
            padding: EdgeInsets.symmetric(vertical: 15),
            color: Theme.of(context).accentColor,
            colorBrightness: Theme.of(context).accentColorBrightness,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
            ),
            onPressed: () async => await _register(),
          ),
        ],
      ),
    );
  }
}