import 'package:ccms/backend/controllers/user_controller.dart';
import 'package:ccms/frontend/widgets/login_widgets/login_button.dart';
import 'package:ccms/frontend/widgets/login_widgets/others/divider_text.dart';
import 'package:ccms/frontend/widgets/login_widgets/buttons/text/dont_have_account_text.dart';
import 'package:ccms/frontend/widgets/login_widgets/buttons/text/forgot_password_container.dart';
import 'package:ccms/frontend/widgets/login_widgets/image/image_login.dart';
import 'package:ccms/frontend/widgets/login_widgets/padding/register_padding.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Color color = Colors.grey;

  UserController userController = UserController();
  @override
  Widget build(BuildContext context) {
    // User user = User(email: watchEmail.text, password: watchPassword.text);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImageLogin(),

              //Email Field
              Container(
                margin: EdgeInsets.only(right: 30, left: 30),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 3,
                      )
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    icon: Icon(Icons.email, color: color),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: userController.setEmail,
                ),
              ),
              SizedBox(height: 24),

              //Password Field
              RegisterPadding(field: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Senha",
                  icon: Icon(Icons.vpn_key, color: color),
                ),
                obscureText: true,
                onChanged: userController.setPassword,
              )),
              ForgotPasswordContainer(),

              //Login Button
              LoginButton(userLogin: userController.user,),
              SizedBox(height: 40,),
              //ButtonCustomizedContainer(text: "LOGIN"),
              DividerText(),
              NoHaveAccountText(),
            ],
          ),
        ));
  }
}
