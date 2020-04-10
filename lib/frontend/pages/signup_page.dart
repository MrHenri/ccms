import 'package:ccms/frontend/widgets/others/birthday_date_pick.dart';
import 'package:ccms/frontend/widgets/buttons/flat/button_customized_container.dart';
import 'package:ccms/frontend/widgets/others/divider_text.dart';
import 'package:ccms/frontend/widgets/buttons/text/have_account.dart';
import 'package:ccms/frontend/widgets/image/image_login.dart';
import 'package:ccms/frontend/widgets/buttons/radio/type_driver_assign.dart';
import 'package:ccms/frontend/widgets/padding/register_padding.dart';
import 'package:ccms/frontend/widgets/text/text_field_cellphone.dart';
import 'package:ccms/frontend/widgets/text/text_field_celula.dart';
import 'package:ccms/frontend/widgets/text/text_field_discipulador.dart';
import 'package:ccms/frontend/widgets/text/text_field_email.dart';
import 'package:ccms/frontend/widgets/text/text_field_name.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  Color color = Colors.grey;
  final watchConfirmPassword = TextEditingController();
  final watchPassword = TextEditingController();

  textListener() {
    print("Current Text is ${watchConfirmPassword.text}");
    print("Current Text is ${watchPassword.text}");
    print(color);
    setState(() {
      color = isPasswordConfirmed(watchPassword.text, watchConfirmPassword.text);
    });
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes
    watchPassword.addListener(textListener);
    watchConfirmPassword.addListener(textListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageLogin(),
            RegisterPadding(field: TextFieldName()),
            SizedBox(height: 24),
            RegisterPadding(field: TextFieldEmail()),
            SizedBox(height: 24),
            RegisterPadding(field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Senha",
                icon: Icon(Icons.vpn_key, color: color),
              ),
              obscureText: true,
              controller: watchPassword,
            )),
            SizedBox(height: 24),
            RegisterPadding(field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Confirmar Senha",
                icon: Icon(Icons.vpn_key, color: color),
              ),
              obscureText: true,
              controller: watchConfirmPassword,
            )),
            SizedBox(height: 24),
            RegisterPadding(field: TextFieldCellphone()),
            SizedBox(height: 24),
            RegisterPadding(field: TextFieldCelula()),
            SizedBox(height: 24),
            RegisterPadding(field: TextFieldDiscipulador()),
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
  Color isPasswordConfirmed(String password, String confirmPassword) {
    if (password == confirmPassword){
      return Colors.green;
    } else{
      return Colors.red;
    }
  }
}
