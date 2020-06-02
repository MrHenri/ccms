import 'package:ccms/backend/models/culto_type.dart';
import 'package:ccms/backend/models/user_group.dart';

class Escala{
  TypeCulto _culto;
  UserGroup _userGroup;
  DateTime _data;

  TypeCulto get culto => _culto;

  set culto(TypeCulto value) {
    _culto = value;
  }

  UserGroup get userGroup => _userGroup;

  set userGroup(UserGroup value) {
    _userGroup = value;
  }

  DateTime get data => _data;

  set data(DateTime value) {
    _data = value;
  }
}