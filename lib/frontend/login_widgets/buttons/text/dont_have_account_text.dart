import 'package:flutter/material.dart';

class NoHaveAccountText extends StatefulWidget {
  NoHaveAccountText({Key key}) : super(key: key);

  @override
  _NoHaveAccountTextState createState() => _NoHaveAccountTextState();
}

class _NoHaveAccountTextState extends State<NoHaveAccountText> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      child: FlatButton(
        splashColor: Colors.transparent,  
        highlightColor: Colors.transparent,
        textTheme: ButtonTextTheme.accent,
        onPressed: (){
          Navigator.of(context).pushNamed('/signup');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Não tem conta? ",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              "Cadastre-se",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}