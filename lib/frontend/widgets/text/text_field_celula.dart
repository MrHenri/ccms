import 'package:flutter/material.dart';

class TextFieldCelula extends StatefulWidget {
  @override
  _TextFieldCelulaState createState() => _TextFieldCelulaState();
}

class _TextFieldCelulaState extends State<TextFieldCelula> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Célula",
        icon: Icon(Icons.add),
      ),
    );
  }
}
