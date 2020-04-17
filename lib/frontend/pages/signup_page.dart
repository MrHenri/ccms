import 'package:ccms/backend/calendar.dart';
import 'package:ccms/backend/register_validation.dart';
import 'package:ccms/backend/user.dart';
import 'package:ccms/frontend/widgets/others/birthday_date_pick.dart';
import 'package:ccms/frontend/widgets/buttons/flat/button_customized_container.dart';
import 'package:ccms/frontend/widgets/others/divider_text.dart';
import 'package:ccms/frontend/widgets/buttons/text/have_account.dart';
import 'package:ccms/frontend/widgets/image/image_login.dart';
import 'package:ccms/frontend/widgets/buttons/radio/type_driver_assign.dart';
import 'package:ccms/frontend/widgets/padding/register_padding.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Color colorName,
      colorEmail,
      colorPassword,
      colorCellphone,
      colorCelula,
      colorDiscipulador,
      colorCalendar = Colors.grey;

  DateTime date;
  Calendar calendar = new Calendar();
  int typeDriver;

  // Watch Parameters
  final watchName = TextEditingController();
  final watchEmail = TextEditingController();
  final watchPassword = TextEditingController();
  final watchConfirmPassword = TextEditingController();
  final watchCellphone = TextEditingController();
  final watchCelula = TextEditingController();
  final watchDiscipulador = TextEditingController();

  textListener() => setState(() {
        colorPassword =
            isPasswordConfirmed(watchPassword.text, watchConfirmPassword.text);
      });

  @override
  void initState() {
    super.initState();
    // Start listening to changes
    watchName.addListener(textListener);
    watchEmail.addListener(textListener);
    watchPassword.addListener(textListener);
    watchConfirmPassword.addListener(textListener);
    watchCellphone.addListener(textListener);
    watchCelula.addListener(textListener);
    watchDiscipulador.addListener(textListener);
    typeDriver = 0;
  }

  @override
  Widget build(BuildContext context) {
    Validation validation = Validation();
    List<Color> listColorIcons = [
      colorName,
      colorEmail,
      colorPassword,
      colorCellphone,
      colorCelula,
      colorDiscipulador,
      colorCalendar
    ];

    User user = User(
      name: watchName.text,
      email: watchEmail.text,
      password: watchPassword.text,
      cellphone: watchCellphone.text,
      celula: watchCelula.text,
      discipulador: watchDiscipulador.text,
      birthday: date,
      typeDriver: validation.whatTypeDriver(typeDriver),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageLogin(),
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Nome Completo",
                icon: Icon(Icons.person),
              ),
              controller: watchName,
            )),
            SizedBox(height: 24),
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
                icon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: watchEmail,
            )),
            SizedBox(height: 24),
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Senha",
                icon: Icon(Icons.vpn_key, color: colorPassword),
              ),
              obscureText: true,
              controller: watchPassword,
            )),
            SizedBox(height: 24),
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Confirmar Senha",
                icon: Icon(Icons.vpn_key, color: colorPassword),
              ),
              obscureText: true,
              controller: watchConfirmPassword,
            )),
            SizedBox(height: 24),
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Número do celular",
                icon: Icon(Icons.call),
              ),
              keyboardType: TextInputType.phone,
              controller: watchCellphone,
            )),
            SizedBox(height: 24),
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Célula",
                icon: Icon(Icons.add),
              ),
              controller: watchCelula,
            )),
            SizedBox(height: 24),
            RegisterPadding(
                field: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Discipulador",
                icon: Icon(Icons.people),
              ),
              controller: watchDiscipulador,
            )),
            SizedBox(height: 24),
            BirthdayDatePick(
                flatButton: FlatButton(
              onPressed: () => configDatePick(),
              child: Row(
                children: <Widget>[
                  Icon(Icons.calendar_today, color: Colors.grey),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    calendar.returnDataUI(date),
                    style: TextStyle(
                      color: calendar.returnDataColor(date),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(height: 24),
            TypeDriver(radioDriver: <Widget>[
              Radio(
                  value: 1,
                  groupValue: typeDriver,
                  onChanged: (value) {
                    setSelectedRadio(value);
                  }),
              Radio(
                  value: 2,
                  groupValue: typeDriver,
                  onChanged: (value) {
                    setSelectedRadio(value);
                  }),
              Radio(
                  value: 3,
                  groupValue: typeDriver,
                  onChanged: (value) {
                    setSelectedRadio(value);
                  }),
              Radio(
                value: 4,
                groupValue: typeDriver,
                onChanged: (value) {
                  setSelectedRadio(value);
                },
              ),
            ]),
            SizedBox(height: 24),
            ButtonCustomizedContainer(
                text: "CADASTRAR",
                user: user,
                confirmPassword: watchConfirmPassword.text,
                listColorIcons: listColorIcons,
            ),
            DividerText(),
            HaveAccountText(),
          ],
        ),
      ),
    );
  }

  Color isPasswordConfirmed(String password, String confirmPassword) =>
      password == confirmPassword && password.length >= 6
          ? Colors.green
          : Colors.red;

  void configDatePick() async {
    final datePick = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1930),
      lastDate: new DateTime.now(),
    );

    if (datePick != null && datePick != date) {
      setState(() {
        date = datePick;
      });
    }
  }

  setSelectedRadio(int value) {
    setState(() {
      typeDriver = value;
    });
  }
}
