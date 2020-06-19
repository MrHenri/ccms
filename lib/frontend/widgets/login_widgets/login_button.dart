import 'package:ccms/backend/controllers/register_validation.dart';
import 'package:ccms/backend/models/user.dart';
import 'package:ccms/backend/services/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {

  final User userLogin;

  const LoginButton({Key key, this.userLogin}) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => _loginConfirm(),
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
      elevation: 12,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.8,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF0081f9),
            Color(0xFF000000),
          ]),
          borderRadius: BorderRadius.circular(90),
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

  _loginConfirm()async{
    FirebaseUser user = await Auth().signIn(widget.userLogin);
    if (user != null) {
      if(Validation().emailConfirmed(user) == null){
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Email não confirmado")));
      }else{
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Login efetuado com sucesso")));
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Email ou Senha inválidos")));
    }
  }
}
