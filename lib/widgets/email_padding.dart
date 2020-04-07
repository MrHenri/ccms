import 'package:flutter/material.dart';

class EmailPadding extends StatefulWidget {
  EmailPadding({Key key}) : super(key: key);

  @override
  _EmailPaddingState createState() => _EmailPaddingState();
}

class _EmailPaddingState extends State<EmailPadding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(60)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 3,
            )
          ]
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Email",
              icon: Icon(
                Icons.email,
                color: Colors.grey,
                ),
            ),
          ),
        ),
      ),
    );
  }
}