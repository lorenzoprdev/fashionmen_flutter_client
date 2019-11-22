import 'package:fashionmen_flutter_client/providers/app_settings.dart';
import 'package:fashionmen_flutter_client/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField(
      {Key key,
      this.textController,
      this.icon,
      this.hintText,
      this.obscureText = false,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeData theme = AppSettings.of(context).theme;

    Color iconColor;
    Color fillColor;

    if(theme.nativeTheme.brightness == Brightness.dark) {
      iconColor = Colors.white70;
      fillColor = theme.nativeTheme.primaryColor;
    } else {
      iconColor = Colors.black54;
      fillColor = Colors.white;
    }

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.16),
          offset: Offset(0, 3),
          blurRadius: 6)
      ]),
      child: TextField(
        obscureText: obscureText,
        controller: textController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: icon != null ? Icon(icon, color: iconColor) : null,
            fillColor: fillColor,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)
            )
        ),
      ),
    );
  }
}
