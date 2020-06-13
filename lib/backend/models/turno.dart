import 'package:ccms/backend/models/user_group.dart';

class Turno {

  DateTime serviceBegin;
  DateTime serviceFinish;
  List<DateTime> servicesOpitional;
  List<UserGroup> groups;

  Turno(this.serviceBegin, this.serviceFinish, this.servicesOpitional,
      this.groups);
}