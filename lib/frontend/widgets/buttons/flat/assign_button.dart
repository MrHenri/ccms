import 'package:flutter/material.dart';

class AssignButton extends StatefulWidget {
  @override
  _AssignButtonState createState() => _AssignButtonState();
}

class _AssignButtonState extends State<AssignButton> {
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