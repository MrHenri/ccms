import 'package:flutter/material.dart';

class TextFieldDiscipulador extends StatefulWidget {
  @override
  _TextFieldDiscipuladorState createState() => _TextFieldDiscipuladorState();
}

class _TextFieldDiscipuladorState extends State<TextFieldDiscipulador> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Discipulador",
        icon: Icon(Icons.people),
      ),
    );
  }
}
