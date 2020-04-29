import 'package:flutter/material.dart';

class ColorDesignIcon{

  Icon _name = Icon(Icons.person);
  Icon _email = Icon(Icons.email);
  Icon _password = Icon(Icons.vpn_key);
  Icon _cellphone = Icon(Icons.call, color: Colors.grey);
  Icon _celula = Icon(Icons.add, color: Colors.grey);
  Icon _discipulador = Icon(Icons.people, color: Colors.grey);
  Icon _birthday = Icon(Icons.calendar_today, color: Colors.grey);

  Icon get name => _name;

  set name(Icon value) {
    _name = value;
  }

  Icon get email => _email;

  set email(Icon value) {
    _email = value;
  }

  Icon get birthday => _birthday;

  set birthday(Icon value) {
    _birthday = value;
  }

  Icon get discipulador => _discipulador;

  set discipulador(Icon value) {
    _discipulador = value;
  }

  Icon get celula => _celula;

  set celula(Icon value) {
    _celula = value;
  }

  Icon get cellphone => _cellphone;

  set cellphone(Icon value) {
    _cellphone = value;
  }

  Icon get password => _password;

  set password(Icon value) {
    _password = value;
  }


}