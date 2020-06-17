import 'package:ccms/backend/controllers/Login_validation.dart';
import 'package:ccms/backend/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final User user;

  const LoginButton({Key key, this.user}) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {


  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () async => await loginConfirm(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
      child: Text(
        "LOGIN",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 2,
        ),
      ),
    );
  }

  loginConfirm()async{
    FirebaseUser user = await Login(context).signIn(widget.user);
    if (user != null) {

      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Login efetuado com sucesso")));
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Email ou Senha inválidos")));
    }
  }
}
