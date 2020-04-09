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
              directionLeft: 30,
              directionTop: 0,
              directionRight: 30,
              directionBottom: 24,
            ),
            RegisterPadding(
              text: "Email", 
              icon: Icon(Icons.email),
              directionLeft: 30,
              directionTop: 0,
              directionRight: 30,
              directionBottom: 24,
            ),
            RegisterPadding(
              text: "Senha", 
              icon: Icon(Icons.vpn_key),
              directionLeft: 30,
              directionTop: 0,
              directionRight: 30,
              directionBottom: 24,
            ),
            RegisterPadding(
              text: "Confirmar Senha", 
              icon: Icon(Icons.vpn_key),
              directionLeft: 30,
              directionTop: 0,
              directionRight: 30,
              directionBottom: 24,
              ),
            RegisterPadding(
              text: "Discipulador", 
              icon: Icon(Icons.people),
              directionLeft: 30,
              directionTop: 0,
              directionRight: 30,
              directionBottom: 24,
              ),
            RegisterPadding(
              text: "Célula", 
              icon: Icon(Icons.add),
              directionLeft: 30,
              directionTop: 0,
              directionRight: 30,
              directionBottom: 24,
            ),
            BirthdayDatePick(),
            TypeDriver(),
            ButtonCustomizedContainer(text: "CADASTRAR"),
            DividerText(),
            HaveAccountText(),
          ],
        ),
      ),
    );
  }
}