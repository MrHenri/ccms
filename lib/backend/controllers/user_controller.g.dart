// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on UserControllerBase, Store {
  final _$emailAtom = Atom(name: 'UserControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: 'UserControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$UserControllerBaseActionController =
      ActionController(name: 'UserControllerBase');

  @override
  dynamic setEmail(String newEmail) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setEmail');
    try {
      return super.setEmail(newEmail);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String newPassword) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setPassword');
    try {
      return super.setPassword(newPassword);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password}
    ''';
  }
}
