import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class Calendar{

  DateTime date;
  BuildContext context;


  Calendar({this.context});

  String returnDataUI(DateTime date) {
    if (date == null) {
      return "Data de Nascimento";
    } else {
      return formatDate(date, [dd, '/', mm, '/', yyyy]).toString();
    }
  }

  Color returnDataColor(DateTime date) {
    if (date == null) {
      return Colors.grey;
    } else {
      return Colors.black;
    }
  }

}