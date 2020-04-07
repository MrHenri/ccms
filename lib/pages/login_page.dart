import 'package:ccms/widgets/divider_text.dart';
import 'package:ccms/widgets/dont_have_account_text.dart';
import 'package:ccms/widgets/email_padding.dart';
import 'package:ccms/widgets/forgot_password_container.dart';
import 'package:ccms/widgets/image_login.dart';
import 'package:ccms/widgets/password_padding.dart';
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
            EmailPadding(),
            PasswordPadding(),
            ForgotPasswordContainer(),
            DividerText(),
            DontHaveAccountText(),
          ],
        ),
      )
    );
  }
}