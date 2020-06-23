// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on LoginControllerBase, Store {
  final _$colorEmailAtom = Atom(name: 'LoginControllerBase.colorEmail');

  @override
  Color get colorEmail {
    _$colorEmailAtom.reportRead();
    return super.colorEmail;
  }

  @override
  set colorEmail(Color value) {
    _$colorEmailAtom.reportWrite(value, super.colorEmail, () {
      super.colorEmail = value;
    });
  }

  final _$colorPasswordAtom = Atom(name: 'LoginControllerBase.colorPassword');

  @override
  Color get colorPassword {
    _$colorPasswordAtom.reportRead();
    return super.colorPassword;
  }

  @override
  set colorPassword(Color value) {
    _$colorPasswordAtom.reportWrite(value, super.colorPassword, () {
      super.colorPassword = value;
    });
  }

  final _$loginConfirmAsyncAction =
      AsyncAction('LoginControllerBase.loginConfirm');

  @override
  Future<String> loginConfirm() {
    return _$loginConfirmAsyncAction.run(() => super.loginConfirm());
  }

  final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase');

  @override
  dynamic setEmail(String newEmail) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setEmail');
    try {
      return super.setEmail(newEmail);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String newPassword) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setPassword');
    try {
      return super.setPassword(newPassword);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
colorEmail: ${colorEmail},
colorPassword: ${colorPassword}
    ''';
  }
}
