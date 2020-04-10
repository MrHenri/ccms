import 'package:ccms/frontend/widgets/buttons/flat/assign_button.dart';
import 'package:ccms/frontend/widgets/buttons/flat/login_button.dart';
import 'package:flutter/material.dart';

class ButtonCustomizedContainer extends StatefulWidget {

  final String text;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String cellPhone;
  final String celula;
  final String discipulador;
  final String date;
  final int driver;

  ButtonCustomizedContainer({
    Key key,
    this.text,
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
  _ButtonCustomizedContainerState createState() =>
      _ButtonCustomizedContainerState();
}

class _ButtonCustomizedContainerState extends State<ButtonCustomizedContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 40),
      width: MediaQuery.of(context).size.width / 1.8,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF0081f9),
          Color(0xFF000000),
        ]),
        borderRadius: BorderRadius.circular(90),
      ),
      child: isLogin(widget.text),
    );
  }

  isLogin(text) {
    if (text == "LOGIN") {
      return LoginButton();
    } else if (text == "CADASTRAR"){
      return AssignButton(
        name: widget.name,
        email: widget.email,
        password: widget.password,
        confirmPassword: widget.confirmPassword,
        cellPhone: widget.cellPhone,
        celula: widget.celula,
        discipulador: widget.discipulador,
        date: widget.date,
        driver: widget.driver);
      }
    }
  }

