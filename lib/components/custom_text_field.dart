import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final IconData icon;
  final String hintText;
  final bool obscureText;

  const CustomTextField(
      {Key key,
      this.textController,
      this.icon,
      this.hintText,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            offset: Offset(0, 3),
            blurRadius: 6)
      ]),
      child: Theme(
        data: Theme.of(context).copyWith(
            primaryColor: Colors.white70,
            brightness: Brightness.dark,
            accentColor: Colors.white70
        ),
        child: TextField(
          obscureText: obscureText,
          controller: textController,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white70,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white70),
              prefixIcon: Icon(icon),
              fillColor: Theme.of(context).primaryColor,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
              )
          ),
        ),
      ),
    );
  }
}
