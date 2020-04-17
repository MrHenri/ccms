import 'package:ccms/backend/register_validation.dart';
import 'package:ccms/backend/Login_validation.dart';
import 'package:ccms/backend/user.dart';
import 'package:flutter/material.dart';

class AssignButton extends StatefulWidget {
  final User user;
  final String confirmPassword;
  final List<Color> listColorIcons;

  const AssignButton(
      {Key key, this.user, this.confirmPassword, this.listColorIcons,})
      : super(key: key);

  @override
  _AssignButtonState createState() => _AssignButtonState();
}

class _AssignButtonState extends State<AssignButton> {

  Validation validation = Validation();

  @override
  Widget build(BuildContext context) {
    Login login = Login();

    return FlatButton(
      onPressed: () async {
        if (Validation(user: widget.user).generalValidation(
            widget.confirmPassword,
            context)  == true) {
          if(await login.signUp(widget.user) != null) {
            Navigator.pop(context);
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("Cadastro efetuado com sucesso")));
          } else {
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("Email já cadastrado ou Inválido")));
          }
        }
      },
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
}
