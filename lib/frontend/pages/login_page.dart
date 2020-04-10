import 'package:ccms/frontend/widgets/others/divider_text.dart';
import 'package:ccms/frontend/widgets/buttons/text/dont_have_account_text.dart';
import 'package:ccms/frontend/widgets/buttons/text/forgot_password_container.dart';
import 'package:ccms/frontend/widgets/image/image_login.dart';
import 'package:ccms/frontend/widgets/buttons/flat/button_customized_container.dart';
import 'package:ccms/frontend/widgets/padding/register_padding.dart';
import 'package:ccms/frontend/widgets/text/text_field_email.dart';
import 'package:ccms/frontend/widgets/text/text_field_password.dart';
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
              RegisterPadding(field: TextFieldEmail()),
              SizedBox(height: 24),
              RegisterPadding(field: TextFieldPassword()),
              ForgotPasswordContainer(),
              ButtonCustomizedContainer(text: "LOGIN"),
              DividerText(),
              NoHaveAccountText(),
            ],
          ),
        ));
  }
}
