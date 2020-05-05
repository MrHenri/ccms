import 'package:ccms/backend/models/calendar.dart';
import 'package:ccms/backend/models/equipe.dart';
import 'package:ccms/frontend/escala_widgets/equipe_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class EscalaPage extends StatefulWidget {
  @override
  _EscalaPageState createState() => _EscalaPageState();
}

class _EscalaPageState extends State<EscalaPage> {
  DateTime _date;
  Calendar _calendar = Calendar();
  Equipe _equipe;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: EquipeTable()
        )
      ),
    );
  }

  void configDatePick() async {
    final datePick = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2030),
    );

    if (datePick != null && datePick != _date) {
      setState(() {
        _date = datePick;
      });
    }
  }
}
