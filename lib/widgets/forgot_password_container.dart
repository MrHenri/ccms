import 'package:flutter/material.dart';

class ForgotPasswordContainer extends StatefulWidget {
  ForgotPasswordContainer({Key key}) : super(key: key);

  @override
  _ForgotPasswordContainerState createState() => _ForgotPasswordContainerState();
}

class _ForgotPasswordContainerState extends State<ForgotPasswordContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 32),
      child: FlatButton(
        onPressed: (){},
        child: Text(
          "Esqueceu a Senha?",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}