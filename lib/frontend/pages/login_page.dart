import 'package:ccms/frontend/widgets/others/divider_text.dart';
import 'package:ccms/frontend/widgets/button/text/dont_have_account_text.dart';
import 'package:ccms/frontend/widgets/button/text/forgot_password_container.dart';
import 'package:ccms/frontend/widgets/image/image_login.dart';
import 'package:ccms/frontend/widgets/button/flat/button_customized_container.dart';
import 'package:ccms/frontend/widgets/padding/register_padding.dart';
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
            ButtonCustomizedContainer(text: "LOGIN"),
            DividerText(),
            NoHaveAccountText(),
          ],
        ),
      )
    );
  }
}