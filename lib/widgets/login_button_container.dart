import 'package:flutter/material.dart';

class LoginButtonContainer extends StatefulWidget {
  LoginButtonContainer({Key key}) : super(key: key);

  @override
  _LoginButtonContainerState createState() => _LoginButtonContainerState();
}

class _LoginButtonContainerState extends State<LoginButtonContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 20),
      width: MediaQuery.of(context).size.width/1.8,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF0081f9),
          Color(0xFF000000),
        ]),
        borderRadius: BorderRadius.circular(90),
      ),
      child: FlatButton(
        onPressed: (){},
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
      ),
    );
  }
}