import 'package:flutter/material.dart';

class DontHaveAccountText extends StatefulWidget {
  DontHaveAccountText({Key key}) : super(key: key);

  @override
  _DontHaveAccountTextState createState() => _DontHaveAccountTextState();
}

class _DontHaveAccountTextState extends State<DontHaveAccountText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      child: FlatButton(
        onPressed: (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Não tem uma conta? ",
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