import 'package:fashionmen_flutter_client/app_localizations.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String) onTextChange;
  final void Function() onClose;

  SearchBar({ this.onTextChange, this.onClose });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Theme(
        data: Theme.of(context).copyWith(
            primaryColor: Colors.white70,
            brightness: Brightness.dark,
            accentColor: Colors.white70
        ),
        child: TextField(
          onChanged: onTextChange,
          autofocus: true,
          cursorColor: Colors.white70,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.search),
            prefixStyle: TextStyle(color: Colors.white70),
            hintText: '${AppLocale.of(context).translate('overall.search')}...',
            hintStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none
            ),
            contentPadding: EdgeInsets.zero,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.close),
              onPressed: onClose,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}