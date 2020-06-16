import 'package:ccms/backend/models/user_group.dart';
import 'package:flutter/material.dart';

class Turno {

  TimeOfDay serviceBegin;
  TimeOfDay serviceFinish;
  List<TimeOfDay> servicesOpitional;
  List<UserGroup> groups;

  Turno({this.serviceBegin, this.serviceFinish, this.servicesOpitional,
      this.groups});
}