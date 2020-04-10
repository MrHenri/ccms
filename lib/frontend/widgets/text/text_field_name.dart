import 'package:flutter/material.dart';

class TextFieldName extends StatefulWidget {

  @override
  _TextFieldNameState createState() => _TextFieldNameState();

}

class _TextFieldNameState extends State<TextFieldName> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Nome Completo",
        icon: Icon(Icons.person),
      ),
    );
  }
}
