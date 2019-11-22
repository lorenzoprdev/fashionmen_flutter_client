import 'package:flutter/material.dart';

class FormErrors extends StatelessWidget {
  const FormErrors({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).errorColor,
        ),
        child: child);
  }
}
