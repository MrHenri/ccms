import 'package:flutter/material.dart';

class TextFieldPassword extends StatefulWidget {
  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {

  final myController = TextEditingController();

  get getPassword => myController.text;

  textListener() {
    print("Current Text is ${myController.text}");
    getPassword(myController.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Senha",
        icon: Icon(Icons.vpn_key),
      ),
      obscureText: true,
      controller: myController,
    );
  }
}
