import 'package:ccms/frontend/widgets/others/birthday_date_pick.dart';
import 'package:ccms/frontend/widgets/button/flat/button_customized_container.dart';
import 'package:ccms/frontend/widgets/others/divider_text.dart';
import 'package:ccms/frontend/widgets/button/text/have_account.dart';
import 'package:ccms/frontend/widgets/image/image_login.dart';
import 'package:ccms/frontend/widgets/button/radio/type_driver_assign.dart';
import 'package:ccms/frontend/widgets/padding/register_padding.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageLogin(),
            RegisterPadding(
              text: "Nome Completo",
              icon: Icon(Icons.person),
            ),
            SizedBox(height: 24),
            RegisterPadding(
              text: "Email",
              icon: Icon(Icons.email),
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 24),
            RegisterPadding(
              text: "Senha",
              icon: Icon(Icons.vpn_key),
              maskText: true,
            ),
            SizedBox(height: 24),
            RegisterPadding(
              text: "Confirmar Senha",
              icon: Icon(Icons.vpn_key),
              maskText: true,
            ),
            SizedBox(height: 24),
            RegisterPadding(
              text: "Discipulador",
              icon: Icon(Icons.people),
            ),
            SizedBox(height: 24),
            RegisterPadding(
              text: "Célula",
              icon: Icon(Icons.add),
            ),
            SizedBox(height: 24),
            BirthdayDatePick(),
            TypeDriver(),
            SizedBox(height: 24),
            ButtonCustomizedContainer(text: "CADASTRAR"),
            DividerText(),
            HaveAccountText(),
          ],
        ),
      ),
    );
  }
}
