import 'package:ccms/backend/dao/register_validation.dart';
import 'package:ccms/backend/dao/Login_validation.dart';
import 'package:ccms/backend/models/user.dart';
import 'package:flutter/material.dart';

class AssignButton extends StatefulWidget {
  final User user;
  final String confirmPassword;

  const AssignButton({Key key, this.user, this.confirmPassword})
      : super(key: key);

  @override
  _AssignButtonState createState() => _AssignButtonState();
}

class _AssignButtonState extends State<AssignButton> {
  Validation validation = Validation();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () async => assign(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
      child: Text(
        "CADASTRAR",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 2,
        ),
      ),
    );
  }

  assign() async {
    Login login = Login();
    Validation validation = Validation(user: widget.user);

    if (validation.generalValidation(widget.confirmPassword, context) == true) { //Validação de preenchimento correto dos dados
      if (await login.signUp(widget.user) != null) { //Validação de Email
        Navigator.pop(context);
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Cadastro efetuado com sucesso")));
      } else {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Email já cadastrado ou Inválido")));
      }
    }
  }
}
