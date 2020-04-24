import 'package:ccms/backend/models/user.dart';
import 'package:ccms/frontend/widgets/others/divider_text.dart';
import 'package:ccms/frontend/widgets/buttons/text/dont_have_account_text.dart';
import 'package:ccms/frontend/widgets/buttons/text/forgot_password_container.dart';
import 'package:ccms/frontend/widgets/image/image_login.dart';
import 'package:ccms/frontend/widgets/buttons/flat/button_customized_container.dart';
import 'package:ccms/frontend/widgets/padding/register_padding.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color color = Colors.grey;

  final watchEmail = TextEditingController();
  final watchPassword = TextEditingController();

  textListener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    //Watch States
    watchEmail.addListener(textListener);
    watchPassword.addListener(textListener);
  }

  @override
  Widget build(BuildContext context) {
    User user = User(email: watchEmail.text, password: watchPassword.text);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImageLogin(),

              //Email Field
              RegisterPadding(
                  field: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email",
                  icon: Icon(Icons.email, color: color),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: watchEmail,
              )),
              SizedBox(height: 24),

              //Password Field
              RegisterPadding(
                  field: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Senha",
                  icon: Icon(Icons.vpn_key, color: color),
                ),
                obscureText: true,
                controller: watchPassword,
              )),
              ForgotPasswordContainer(),

              //Login Button
              ButtonCustomizedContainer(text: "LOGIN", user: user),
              DividerText(),
              NoHaveAccountText(),
            ],
          ),
        ));
  }
}
