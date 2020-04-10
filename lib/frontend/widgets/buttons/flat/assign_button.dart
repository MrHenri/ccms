import 'package:ccms/backend/services/user_management.dart';
import 'package:ccms/backend/signup_validation.dart';
import 'package:ccms/backend/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AssignButton extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String cellPhone;
  final String celula;
  final String discipulador;
  final String date;
  final int driver;

  const AssignButton({
    Key key,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.cellPhone,
    this.celula,
    this.discipulador,
    this.date,
    this.driver,
  }) : super(key: key);

  @override
  _AssignButtonState createState() => _AssignButtonState();
}

class _AssignButtonState extends State<AssignButton> {

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        if (loginValidation()){
          register();
        } else {
          setState(() {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Probleminhas")));
          });
        }
        //Navigator.pop(context);
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
  register(){
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: widget.email, password: widget.password)
        .then((singnedInUser) {
          UserManagement().storeNewUser(singnedInUser, context);
    })
        .catchError((e){print(e);});
//    Signup signup = Signup(
//      name: widget.name,
//      email: widget.email,
//      password: widget.password,
//      confirmPassword: widget.confirmPassword,
//      cellPhone: widget.cellPhone,
//      celula: widget.celula,
//      discipulador: widget.discipulador,
//      date: widget.date,
//      driver: widget.driver
//    );
//    signup.register();
  }

  bool loginValidation(){
    Signup signup = Signup.Validation(
        password: widget.password,
        confirmPassword: widget.confirmPassword,
        driver: widget.driver);

    bool password = signup.isPasswordValid(widget.password, widget.confirmPassword);
    bool driver = signup.isDriverValid(widget.driver);

    return password && driver ? true : false;
  }

}
