import 'package:flutter/material.dart';

class TextFieldCellphone extends StatefulWidget {
  @override
  _TextFieldCellphoneState createState() => _TextFieldCellphoneState();
}

class _TextFieldCellphoneState extends State<TextFieldCellphone> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Número do celular",
        icon: Icon(Icons.call),
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
