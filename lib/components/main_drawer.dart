import 'package:fashionmen_flutter_client/app_localizations.dart';
import 'package:fashionmen_flutter_client/models/user.dart';
import 'package:fashionmen_flutter_client/services/user_service.dart';
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
    _currentUser = _userService.getUser();
  }

  @override
  Widget build(BuildContext context) {
    if(_currentUser == null) {
      return Theme(
        data: Theme.of(context).copyWith(
          brightness: Brightness.dark,
          canvasColor: Theme.of(context).primaryColor,
          iconTheme: IconThemeData(color: Colors.white70),
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
                        color: Theme.of(context).primaryColorLight,
                      ),
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context).translate('overall.login'),
                        style: TextStyle(color: Colors.white)),
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
                        title: Text(AppLocalizations.of(context).translate('overall.settings'),
                            style: TextStyle(color: Colors.white)),
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
      data: Theme.of(context).copyWith(
        brightness: Brightness.dark,
        canvasColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Colors.white70),
      ),
      child: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0.0),
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(_currentUser.nombre_completo),
                    accountEmail: Text(_currentUser.correo_electronico),
                    decoration: BoxDecoration(color: Theme.of(context).primaryColorLight),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(_userService.getProfileImageUrl()),
                    )
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).translate('overall.profile'),
                            style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.person),
                    onTap: () => Navigator.popAndPushNamed(context, '/profile'),
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).translate('overall.orders'),
                            style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.local_shipping),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).translate('overall.cart'),
                            style: TextStyle(color: Colors.white)),
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
                      title: Text(AppLocalizations.of(context).translate('overall.logout'),
                            style: TextStyle(color: Colors.white)),
                      leading: Icon(Icons.exit_to_app),
                      onTap: () {
                        _userService.logout();
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context).translate('overall.settings'),
                            style: TextStyle(color: Colors.white)),
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
}