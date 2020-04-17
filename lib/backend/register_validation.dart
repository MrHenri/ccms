import 'package:ccms/backend/type_driver.dart';
import 'package:ccms/backend/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Validation {

  User user;


  Validation([this.user]);

  bool isNameValid() => user.name != "" ? true : false;

  bool isPasswordValid(String confirmPassword, BuildContext context) {
    if (user.password == confirmPassword && user.password.length >= 6) {
      return true;
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              "As senhas precisa ter mais de 6 caracteres e serem iguais")));
      return false;
    }
  }

  isCellphoneValid() => user.cellphone.length >= 8 ? true : false;

  isCelulaValid() => user.celula != "" ? true : false;

  isDiscipuladorValid() => user.discipulador != "" ? true : false;

  isBirthdayValid() => user.birthday != null ? true : false;

  TypeDriver whatTypeDriver(int typeDriver) {
    switch (typeDriver) {
      case 0:
        {
          return TypeDriver.None;
        }
        break;
      case 1:
        {
          return TypeDriver.A;
        }
        break;
      case 2:
        {
          return TypeDriver.B;
        }
        break;
      case 3:
        {
          return TypeDriver.AB;
        }
        break;
      default:
        {
          return TypeDriver.Nao_Habilitado;
        }
        break;
    }
  }

  bool generalValidation(String confirmPassword, BuildContext context) {
    bool validationPassword = this.isPasswordValid(confirmPassword, context);
    bool validationTypeDriver = user.typeDriver.index != 0 ? true : false;

    if (validationPassword &&
        validationTypeDriver &&
        isNameValid() &&
        isCellphoneValid() &&
        isCelulaValid() &&
        isDiscipuladorValid() &&
        isBirthdayValid()){
      return true;
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              "Preencha adequadamente todos os campos")));
    }

  }
}
