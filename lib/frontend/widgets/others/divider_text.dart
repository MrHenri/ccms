import 'package:flutter/material.dart';

class DividerText extends StatefulWidget {
  DividerText({Key key}) : super(key: key);

  @override
  _DividerTextState createState() => _DividerTextState();
}

class _DividerTextState extends State<DividerText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            indent: 20,
            endIndent: 10,
            color: Color(0xFF0081f9),
          ),
        ),       
        Text("OU"),        
        Expanded(
          child: Divider(
            indent: 10,
            endIndent: 20,
            color: Color(0xFF000000),
          ),
        ),
      ],
    );
  }
}