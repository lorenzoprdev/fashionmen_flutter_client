import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  final List<String> sizes;

  SizeSelector({this.sizes});

  @override
  State<StatefulWidget> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String _currentSize;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: (_currentSize == null
            ? _currentSize = widget.sizes[0]
            : _currentSize),
        items: [
          for (String size in widget.sizes)
            DropdownMenuItem(
              value: size,
              child: Text(size),
            )
        ],
        onChanged: (selected) {
          setState(() {
            _currentSize = selected;
          });
        },
      ),
    );
  }
}