import 'package:ccms/backend/models/turno.dart';
import 'package:ccms/frontend/escala_widgets/add_group_inturno_container.dart';
import 'package:ccms/frontend/escala_widgets/time_of_turno_container.dart';
import 'package:flutter/material.dart';

class ListTurnoBuilder extends StatefulWidget {

  final List<Turno> turnos;

  const ListTurnoBuilder({Key key, this.turnos}) : super(key: key);

  @override
  _ListTurnoBuilderState createState() => _ListTurnoBuilderState(this.turnos);
}

class _ListTurnoBuilderState extends State<ListTurnoBuilder> {

  List<Turno> turnos;

  _ListTurnoBuilderState(this.turnos);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: turnos.length,
      itemBuilder: (BuildContext context, index){
        return Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TimeOfTurnoContainer(turno: turnos[index]),
              AddGroupInTurnoContainer(),
            ],
          ),
        );
      },
    );
  }
}
