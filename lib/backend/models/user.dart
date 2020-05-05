import 'package:ccms/backend/models/type_driver.dart';
import 'package:ccms/backend/user_type.dart';

class User {
  String name;
  String email;
  String password;
  String cellphone;
  String discipulador;
  String celula;
  DateTime birthday;
  TypeDriver typeDriver;
  UserType userType; //enum representing the userType (leader or servant)
  bool isInGroup = false;

  User({this.name, this.email, this.password, this.cellphone,
    this.discipulador, this.celula, this.birthday, this.typeDriver, this.userType});

  User.login({this.email, this.password});

  String getName(){
    return this.name;
  }

}
