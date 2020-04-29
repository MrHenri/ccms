import 'package:ccms/backend/models/type_driver.dart';

class User {
  String name;
  String email;
  String password;
  String cellphone;
  String discipulador;
  String celula;
  DateTime birthday;
  TypeDriver typeDriver;


  User({this.name, this.email, this.password, this.cellphone,
    this.discipulador, this.celula, this.birthday, this.typeDriver});

  User.login({this.email, this.password});


}
