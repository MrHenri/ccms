import 'package:ccms/widgets/divider_text.dart';
import 'package:ccms/widgets/dont_have_account_text.dart';
import 'package:ccms/widgets/forgot_password_container.dart';
import 'package:ccms/widgets/image_login.dart';
import 'package:ccms/widgets/button_customized_container.dart';
import 'package:ccms/widgets/register_padding.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageLogin(),
            RegisterPadding(
              text: "Email", 
              icon: Icon(Icons.email, color: Colors.grey),
              directionLeft: 30,
              directionTop: 0,
              directionRight: 30,
              directionBottom: 24,
            ),
            RegisterPadding(
              text: "Senha", 
              icon: Icon(Icons.vpn_key, color: Colors.grey),
              directionLeft: 30,
              directionTop: 0,
              directionRight: 30,
              directionBottom: 0,
            ),
            ForgotPasswordContainer(),
            ButtonCustomizedContainer(text: "LOGIN",),
            DividerText(),
            IsHaveAccountText(question: "Não tem conta? ",awnser: "Cadastre-se"),
          ],
        ),
      )
    );
  }
}