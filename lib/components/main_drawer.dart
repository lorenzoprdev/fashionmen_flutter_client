import 'package:fashionmen_flutter_client/app_localizations.dart';
import 'package:fashionmen_flutter_client/models/user.dart';
import 'package:fashionmen_flutter_client/providers/app_settings.dart';
import 'package:fashionmen_flutter_client/services/user_service.dart';
import 'package:fashionmen_flutter_client/themes.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final UserService _userService = UserService();
  User _currentUser;

  @override
  void initState() {
    super.initState();
    _userService.getUser().then((user) {
      setState(() {
        _currentUser = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    AppThemeData theme = AppSettings.of(context).theme;
    if(_currentUser == null) {
      return Theme(
        data: theme.nativeTheme.copyWith(
          canvasColor: theme.background
        ),
        child: Drawer(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(0.0),
                  children: [
                    DrawerHeader(
                      child: SvgPicture.asset(
                          'assets/icons/fashion_men_icon_no_padding.svg'
                      ),
                      decoration: BoxDecoration(
                        color: theme.backgroundPrimary,
                      ),
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    ListTile(
                      title: Text(AppLocale.of(context).translate('overall.login')),
                      leading: Icon(Icons.input),
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        title: Text(AppLocale.of(context).translate('overall.settings')),
                        leading: Icon(Icons.settings),
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/settings');
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
    return Theme(
      data: theme.nativeTheme.copyWith(
          canvasColor: theme.background
      ),
      child: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0.0),
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(_currentUser.full_name),
                    accountEmail: Text(_currentUser.email),
                    decoration: BoxDecoration(
                      color: theme.backgroundPrimary
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(_userService.getProfileImageUrl()),
                    )
                  ),
                  ListTile(
                    title: Text(AppLocale.of(context).translate('overall.profile')),
                    leading: Icon(Icons.person),
                    onTap: () => Navigator.popAndPushNamed(context, '/profile'),
                  ),
                  ListTile(
                    title: Text(AppLocale.of(context).translate('overall.orders')),
                    leading: Icon(Icons.local_shipping),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(AppLocale.of(context).translate('overall.cart')),
                    leading: Icon(Icons.shopping_cart),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                      title: Text(AppLocale.of(context).translate('overall.logout')),
                      leading: Icon(Icons.exit_to_app),
                      onTap: () {
                        _userService.logout();
                        Navigator.pop(context);
                        showLogoutSnackbar(context);
                      },
                    ),
                    ListTile(
                      title: Text(AppLocale.of(context).translate('overall.settings')),
                      leading: Icon(Icons.settings),
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/settings');
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showLogoutSnackbar(BuildContext context) {
    Flushbar(
      message: AppLocale.of(context).translate('overall.logout_successful'),
      duration: Duration(seconds: 1),
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      animationDuration: Duration(milliseconds: 250),
    )..show(context);
  }
}