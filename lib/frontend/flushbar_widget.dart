import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';


class PersonalFlushBar{

  Flushbar showFlushBar({String title, String message, BuildContext context}) {
    String _title = title;
    String _message = message;
    return Flushbar(
      title: _title,
      message: _message,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}