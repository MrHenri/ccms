import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class BirthdayDatePick extends StatefulWidget {

  final FlatButton flatButton;

  const BirthdayDatePick({Key key, this.flatButton}) : super(key: key);

  @override
  _BirthdayDatePickState createState() => _BirthdayDatePickState();
}

class _BirthdayDatePickState extends State<BirthdayDatePick> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30, left: 30),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(60)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 3,
            )
          ]),
        child: widget.flatButton,
      );
  }
}
