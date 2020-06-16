import 'package:ccms/backend/models/turno.dart';
import 'package:flutter/material.dart';

class TimeOfTurnoContainer extends StatelessWidget {

  final Turno turno;
  const TimeOfTurnoContainer({Key key, this.turno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 0),
              color: Color.fromRGBO(127, 140, 141, 0.5),
              spreadRadius: 2)
        ],
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Text(
          "${turno.serviceBegin.format(context)} - ${turno.serviceFinish.format(context)}",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14)
      ),
    );
  }
}
