import 'package:flutter/material.dart';

class Assign extends StatefulWidget {
  @override
  _AssignState createState() => _AssignState();
}

class _AssignState extends State<Assign> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.pop(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90)
      ),
      child: Text(
        "CADASTRAR",
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