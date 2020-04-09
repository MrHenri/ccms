import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90)
      ),
      child: Text(
        "LOGIN",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 2,
        ),
      ),
    );
  }
}