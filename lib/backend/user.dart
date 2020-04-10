import 'package:ccms/backend/type_driver.dart';

class User {
  String _nome;
  String _email;
  String _senha;
  String _cellphone;
  String _discipulador;
  String _celula;
  DateTime _birthday;
  TypeDriver _typeDriver;

  User(this._nome, this._email, this._senha, this._cellphone,
      this._discipulador, this._celula,
      this._birthday, this._typeDriver);

  TypeDriver get typeDriver => _typeDriver;

  set typeDriver(TypeDriver value) {
    _typeDriver = value;
  }

  DateTime get birthday => _birthday;

  set birthday(DateTime value) {
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

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }


}