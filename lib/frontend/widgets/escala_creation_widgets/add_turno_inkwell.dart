import 'package:ccms/backend/models/turno.dart';
import 'package:ccms/frontend/widgets/escala_creation_widgets/time_turno_picker.dart';
import 'package:flutter/material.dart';
import 'package:time_range_picker/time_range_picker.dart';

class AddTurnoInkWell extends StatefulWidget {

  final ValueChanged<Turno> refreshTurnoList;

  const AddTurnoInkWell({Key key, this.refreshTurnoList}) : super(key: key);

  @override
  _AddTurnoInkWellState createState() => _AddTurnoInkWellState(this.refreshTurnoList);
}

class _AddTurnoInkWellState extends State<AddTurnoInkWell> {

  ValueChanged<Turno> refreshTurnoList;

  _AddTurnoInkWellState(this.refreshTurnoList);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()  async {
        Turno turno = Turno();
        TimeRange result = await TimeTurnoPicker(context).timeTurno();
        turno.serviceBegin = result.startTime;
        turno.serviceFinish = result.endTime;
        refreshTurnoList(turno);
      },
      child: Container(
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
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.add),
            SizedBox(width: 16.0),
            Text("Adicionar Turno"),
          ],
        ),
      ),
    );

  }


}
