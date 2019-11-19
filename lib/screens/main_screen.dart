import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:fashionmen_flutter_client/components/search_bar.dart';
import 'package:fashionmen_flutter_client/pages/product_page.dart';
import 'package:fashionmen_flutter_client/pages/profile_page.dart';
import 'package:fashionmen_flutter_client/services/product_service.dart';
import 'package:fashionmen_flutter_client/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final productService = ProductService();
  final userService = UserService();

  int _selectedPage = 0;
  bool _searchEnabled = false;
  String _searchCriteria;

  List<Widget> _getActions() {
    List<Widget> actions = new List<Widget>();
    actions.add(IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        setState(() {
          _searchEnabled = true;
        });
      },
    ));
    if(userService.getUser() != null) {
      actions.add(new PopupMenuButton<String>(
        onSelected: (_) {
          setState(() {
            userService.logout();
            _selectedPage = 0;
          });
          Future(() {
            Navigator.of(context).pushReplacementNamed("/");
          });
        },
        icon: Icon(Icons.more_vert),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: Text("Log out"),
              value: "logout",
            )
          ];
        },
      ));
    }
    return actions;
  }

  AppBar _getAppBar() {
    if(_searchEnabled)
      return AppBar(
        title: SearchBar(
          onTextChange: (text) {
            setState(() {
              _searchCriteria = text;
            });
          },
          onClose: () {
            setState(() {
              _searchEnabled = false;
              _searchCriteria = null;
            });
          },
        ),
      );
    else
      return AppBar(
        title: Text("Fashion Men"),
        actions: _getActions()
      );
  }

  Widget getPage(int page) {
    switch(_selectedPage) {
      case 0:
        return ProductPage(searchCriteria: _searchCriteria);
        break;
      case 1:
        return ProfilePage(onLoginCancelled: () async {
          setState(() {
            _selectedPage = 0;
          });
        });
        break;
      default:
        return Center(child: Text("Page not found"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: getPage(_selectedPage),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Catálogo'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('Perfil')
          )
        ],
      ),
    );
  }
}

