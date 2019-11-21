import 'package:fashionmen_flutter_client/app_localizations.dart';
import 'package:fashionmen_flutter_client/models/user.dart';
import 'package:fashionmen_flutter_client/providers/app_settings.dart';
import 'package:fashionmen_flutter_client/services/user_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final void Function() onLoginCancelled;

  const ProfileScreen({Key key, this.onLoginCancelled}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserService _userService = UserService();
  User _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = _userService.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocale.of(context).translate('overall.profile')),
      ),
      backgroundColor: AppSettings.of(context).theme.getPageBackground(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(_userService.getProfileImageUrl()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      _currentUser.full_name,
                      style: Theme.of(context).textTheme.display2,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}