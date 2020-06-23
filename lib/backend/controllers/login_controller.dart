import 'package:ccms/backend/services/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {

  String email;
  String password;

  @observable
  Color colorEmail = Colors.grey;

  @observable
  Color colorPassword = Colors.grey;

  @action
  setEmail(String newEmail) => email = newEmail;

  @action
  setPassword(String newPassword) => password = newPassword;


  @action
  Future<String> loginConfirm() async {
    FirebaseUser user = await Auth().signIn(email, password);
    try {
      if (user.isEmailVerified) {
        return "Logado com Sucesso";
      } else {
        colorEmail = Colors.red;
        colorPassword = Colors.grey;
        return "Email não verificado";
      }
    } catch (e) {
      print(e);
      colorEmail = Colors.red;
      colorPassword = Colors.red;
      return "Email ou Senha incorretos";
    }
  }
}
