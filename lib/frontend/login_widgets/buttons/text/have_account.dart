import 'package:flutter/material.dart';

class HaveAccountText extends StatefulWidget {
  @override
  _HaveAccountTextState createState() => _HaveAccountTextState();
}

class _HaveAccountTextState extends State<HaveAccountText> {
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
          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Já tem uma conta? ",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              "Faça Login",
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