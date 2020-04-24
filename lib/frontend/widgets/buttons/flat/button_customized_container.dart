import 'package:ccms/backend/models/user.dart';
import 'package:ccms/frontend/widgets/buttons/flat/assign_button.dart';
import 'package:ccms/frontend/widgets/buttons/flat/login_button.dart';
import 'package:flutter/material.dart';

class ButtonCustomizedContainer extends StatefulWidget {
  final String text; //LOGIN OU CADASTRO
  final User user;
  final String confirmPassword;

  ButtonCustomizedContainer({
    Key key,
    this.text,
    this.user,
    this.confirmPassword,
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
      return LoginButton(
        user: widget.user,
      );
    } else if (text == "CADASTRAR") {
      return AssignButton(
        user: widget.user,
        confirmPassword: widget.confirmPassword,
      );
    }
  }
}
