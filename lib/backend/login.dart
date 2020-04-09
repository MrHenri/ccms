import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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