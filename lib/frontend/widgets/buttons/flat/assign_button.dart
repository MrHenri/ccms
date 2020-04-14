import 'package:ccms/backend/register_validation.dart';
import 'package:ccms/backend/Login_validation.dart';
import 'package:ccms/backend/user.dart';
import 'package:flutter/material.dart';

class AssignButton extends StatefulWidget {
  final User user;
  final String confirmPassword;

  const AssignButton({Key key,this.user, this.confirmPassword,}) : super(key: key);

  @override
  _AssignButtonState createState() => _AssignButtonState();
}

class _AssignButtonState extends State<AssignButton> {

  @override
  Widget build(BuildContext context) {

    Login login = Login();
    Validation validation = Validation();

    return FlatButton(
      onPressed: () {
        if(validation.generalValidation(
            widget.user.password,
            widget.confirmPassword,
            widget.user.typeDriver)){
          login.signUp(widget.user);
          Navigator.pop(context);
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Cadastro efetuado com sucesso")));
        } else{
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Problemas com o cadastro")));
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
