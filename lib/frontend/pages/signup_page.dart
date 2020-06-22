import 'package:ccms/backend/controllers/user_controller.dart';
import 'package:ccms/frontend/widgets/login_widgets/buttons/flat/assign_button.dart';
import 'package:ccms/frontend/widgets/login_widgets/others/birthday_date_pick.dart';
import 'package:ccms/frontend/widgets/login_widgets/others/divider_text.dart';
import 'package:ccms/frontend/widgets/login_widgets/buttons/text/have_account.dart';
import 'package:ccms/frontend/widgets/login_widgets/image/image_login.dart';
import 'package:ccms/frontend/widgets/login_widgets/buttons/radio/type_driver_assign.dart';
import 'package:ccms/frontend/widgets/login_widgets/padding/register_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  UserController userController = UserController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageLogin(),

            //Name Field
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Nome Completo",
                icon: Icon(Icons.person),
              ),
              onChanged: userController.setName,
            )),
            SizedBox(height: 24),

            //Email Field
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
                icon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: userController.setEmail,
            )),
            SizedBox(height: 24),

            //Password Field
            Observer(
              builder: (_) => RegisterPadding(
                  field: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Senha",
                  icon: Icon(Icons.vpn_key, color: userController.colorPassword),
                ),
                obscureText: true,
                onChanged: userController.setPassword,
              )),
            ),
            SizedBox(height: 24),

            //ConfirmPassword Field
            Observer(
              builder: (_) => RegisterPadding(
                  field: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Confirmar Senha",
                  icon: Icon(Icons.vpn_key, color: userController.colorPassword),
                ),
                obscureText: true,
                onChanged: userController.confirmPassword,
              )),
            ),
            SizedBox(height: 24),

            //Cellphone Field
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Número do celular",
                icon: Icon(Icons.call),
              ),
              keyboardType: TextInputType.phone,
              onChanged: userController.setCellPhone,
            )),
            SizedBox(height: 24),

            //Célula Field
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Célula",
                icon: Icon(Icons.add),
              ),
              onChanged: userController.setCelula,
            )),
            SizedBox(height: 24),

            //Discipulador Field
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Discipulador",
                icon: Icon(Icons.people),
              ),
              onChanged: userController.setDiscipulador,
            )),
            SizedBox(height: 24),

            //Birthday Field
            Observer(
              builder: (_) => BirthdayDatePick(
                  flatButton: FlatButton(
                onPressed: () => userController.configDatePick(context),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today, color: Colors.grey),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
//                      calendar.returnDataUI(userController.user.birthday, "Data de Nascimento"),
                    userController.dateText,
                      style: TextStyle(
                        color: userController.colorDateBirthday,
                      ),
                    ),
                  ],
                ),
              )),
            ),
            SizedBox(height: 24),

            //TypeDriver Radio
            Observer(
              builder: (_) => TypeDriver(radioDriver: <Widget>[
                Radio(
                    value: 1,
                    groupValue: userController.valueTypeDriver,
                    onChanged: userController.setTypeDriver,
                ),
                Radio(
                    value: 2,
                    groupValue: userController.valueTypeDriver,
                    onChanged: userController.setTypeDriver
                ),
                Radio(
                    value: 3,
                    groupValue: userController.valueTypeDriver,
                    onChanged: userController.setTypeDriver
                ),
                Radio(
                  value: 4,
                  groupValue: userController.valueTypeDriver,
                  onChanged: userController.setTypeDriver,
                ),
              ]),
            ),
            SizedBox(height: 24),

            //Assign Button
            AssignButton(
                user: userController.user,
                confirmPassword: userController.secondPassword,
            ),
            SizedBox(height: 40),

            DividerText(),
            HaveAccountText(),
          ],
        ),
      ),
    );
  }
}
