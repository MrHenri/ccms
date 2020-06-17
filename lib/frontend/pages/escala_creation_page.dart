import 'package:ccms/backend/models/culto_type.dart';
import 'package:ccms/backend/models/escala.dart';
import 'package:ccms/backend/models/turno.dart';
import 'package:ccms/frontend/widgets/escala_creation_widgets/add_turno_inkwell.dart';
import 'package:ccms/frontend/widgets/escala_creation_widgets/escala_name_container.dart';
import 'package:ccms/frontend/widgets/escala_creation_widgets/list_turno_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EscalaCreationPage extends StatefulWidget {
  final Escala escala;

  const EscalaCreationPage({Key key, this.escala}) : super(key: key);

  @override
  _EscalaCreationPageState createState() =>
      _EscalaCreationPageState(this.escala);
}

class _EscalaCreationPageState extends State<EscalaCreationPage> {
  Escala escala = Escala();
  List<Turno> turnos = List<Turno>();

  _EscalaCreationPageState(this.escala);

  refreshEscalaName(String escalaName) => escala.name = escalaName;

  refreshTurnoList(Turno turno){
    setState(() {
      turnos.add(turno);
      escala.turnos = turnos;
    });
  }

  @override
  Widget build(BuildContext context) {
    String typeCultoText = typeCultoToString(escala.typeCulto);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "$typeCultoText - ${escala.month}",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
        elevation: 16,
        leading: Container(
          margin: EdgeInsets.all(6),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.event_available,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          EscalaNameContainer(escalaNameRefresh: refreshEscalaName),
          turnos.length == 0 ? Container() : ListTurnoBuilder(turnos: turnos),
          AddTurnoInkWell(refreshTurnoList: refreshTurnoList),
        ],
      ),
    );
  }
}
