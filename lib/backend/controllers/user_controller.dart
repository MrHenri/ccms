import 'package:ccms/backend/controllers/register_validation.dart';
import 'package:ccms/backend/models/user.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  @observable
  User user = User();

  @observable
  String secondPassword = "";

  @observable
  String dateText = "Data de Nascimento";

  @observable
  int valueTypeDriver = 0;

  @observable
  Color colorPassword = Colors.grey;
  
  @observable
  Color colorDateBirthday = Colors.grey;

  @action
  setName(String newName) => user.name = newName;

  @action
  setEmail(String newEmail) => user.email = newEmail;

  @action
  setPassword(String newPassword) {
    user.password = newPassword;
    colorPassword = secondPassword == user.password && secondPassword.length >= 6 ? Colors.green : Colors.red;
  }

  @action
  setCellPhone(String newCellPhone) => user.cellphone = newCellPhone;

  @action
  setCelula(String newCelula) => user.celula = newCelula;

  @action
  setDiscipulador(String newDiscipulador) =>
      user.discipulador = newDiscipulador;

  @action
  setTypeDriver(int value) {
    user.typeDriver = Validation().whatTypeDriver(value);
    valueTypeDriver = value;
  }

  @action
  confirmPassword(String newPassword) {
    secondPassword = newPassword;
    colorPassword = secondPassword == user.password ? Colors.green : Colors.red;
  }

  @action
  configDatePick(BuildContext context) async {
    final datePick = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1930),
      lastDate: new DateTime.now(),
    );

    if (datePick != null && datePick != user.birthday) {
      user.birthday = datePick;
      dateText = formatDate(user.birthday, [dd, '/', mm, '/', yyyy]).toString();
      colorDateBirthday = Colors.black;
    }
  }
}
