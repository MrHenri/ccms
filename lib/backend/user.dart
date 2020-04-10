import 'package:ccms/backend/type_driver.dart';

class User {
  String _name;
  String _email;
  String _password;
  String _cellphone;
  String _discipulador;
  String _celula;
  String _birthday;
  TypeDriver _typeDriver;

  User(this._name, this._email, this._password, this._cellphone,
      this._discipulador, this._celula, [this._birthday, this._typeDriver]);

  TypeDriver get typeDriver => _typeDriver;

  set typeDriver(TypeDriver value) {
    _typeDriver = value;
  }

  String get birthday => _birthday;

  set birthday(String value) {
    _birthday = value;
  }

  String get celula => _celula;

  set celula(String value) {
    _celula = value;
  }

  String get discipulador => _discipulador;

  set discipulador(String value) {
    _discipulador = value;
  }

  String get cellphone => _cellphone;

  set cellphone(String value) {
    _cellphone = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
