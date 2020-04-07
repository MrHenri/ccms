import 'package:flutter/material.dart';

class PasswordPadding extends StatefulWidget {
  PasswordPadding({Key key}) : super(key: key);

  @override
  _PasswordPaddingState createState() => _PasswordPaddingState();
}

class _PasswordPaddingState extends State<PasswordPadding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 16, 30, 0),
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
              hintText: "Senha",
              icon: Icon(
                Icons.vpn_key,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}