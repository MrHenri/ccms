import 'package:ccms/backend/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {

  final LoginController loginController;

  const LoginButton({Key key, this.loginController}) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState(this.loginController);
}

class _LoginButtonState extends State<LoginButton> {

  LoginController loginController = LoginController();

  _LoginButtonState(this.loginController);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      highlightElevation: 12,
      onPressed: () => _loginConfirm(),
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
      elevation: 6,
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
    String message = await loginController.loginConfirm();
    message == "Logado com Sucesso" ?
        Navigator.of(context).pushReplacementNamed('/home') :
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
