// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on UserControllerBase, Store {
  final _$userAtom = Atom(name: 'UserControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$secondPasswordAtom = Atom(name: 'UserControllerBase.secondPassword');

  @override
  String get secondPassword {
    _$secondPasswordAtom.reportRead();
    return super.secondPassword;
  }

  @override
  set secondPassword(String value) {
    _$secondPasswordAtom.reportWrite(value, super.secondPassword, () {
      super.secondPassword = value;
    });
  }

  final _$dateTextAtom = Atom(name: 'UserControllerBase.dateText');

  @override
  String get dateText {
    _$dateTextAtom.reportRead();
    return super.dateText;
  }

  @override
  set dateText(String value) {
    _$dateTextAtom.reportWrite(value, super.dateText, () {
      super.dateText = value;
    });
  }

  final _$valueTypeDriverAtom =
      Atom(name: 'UserControllerBase.valueTypeDriver');

  @override
  int get valueTypeDriver {
    _$valueTypeDriverAtom.reportRead();
    return super.valueTypeDriver;
  }

  @override
  set valueTypeDriver(int value) {
    _$valueTypeDriverAtom.reportWrite(value, super.valueTypeDriver, () {
      super.valueTypeDriver = value;
    });
  }

  final _$colorPasswordAtom = Atom(name: 'UserControllerBase.colorPassword');

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

  final _$colorDateBirthdayAtom =
      Atom(name: 'UserControllerBase.colorDateBirthday');

  @override
  Color get colorDateBirthday {
    _$colorDateBirthdayAtom.reportRead();
    return super.colorDateBirthday;
  }

  @override
  set colorDateBirthday(Color value) {
    _$colorDateBirthdayAtom.reportWrite(value, super.colorDateBirthday, () {
      super.colorDateBirthday = value;
    });
  }

  final _$configDatePickAsyncAction =
      AsyncAction('UserControllerBase.configDatePick');

  @override
  Future configDatePick(BuildContext context) {
    return _$configDatePickAsyncAction.run(() => super.configDatePick(context));
  }

  final _$UserControllerBaseActionController =
      ActionController(name: 'UserControllerBase');

  @override
  dynamic setName(String newName) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setName');
    try {
      return super.setName(newName);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic setCellPhone(String newCellPhone) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setCellPhone');
    try {
      return super.setCellPhone(newCellPhone);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCelula(String newCelula) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setCelula');
    try {
      return super.setCelula(newCelula);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDiscipulador(String newDiscipulador) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setDiscipulador');
    try {
      return super.setDiscipulador(newDiscipulador);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTypeDriver(int value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setTypeDriver');
    try {
      return super.setTypeDriver(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic confirmPassword(String newPassword) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.confirmPassword');
    try {
      return super.confirmPassword(newPassword);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
secondPassword: ${secondPassword},
dateText: ${dateText},
valueTypeDriver: ${valueTypeDriver},
colorPassword: ${colorPassword},
colorDateBirthday: ${colorDateBirthday}
    ''';
  }
}
