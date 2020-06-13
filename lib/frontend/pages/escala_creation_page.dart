import 'package:ccms/backend/models/culto_type.dart';
import 'package:ccms/backend/models/escala.dart';
import 'package:flutter/material.dart';

class EscalaCreationPage extends StatefulWidget {

  final Escala escala;

  const EscalaCreationPage({Key key, this.escala}) : super(key: key);

  @override
  _EscalaCreationPageState createState() => _EscalaCreationPageState(this.escala);
}

class _EscalaCreationPageState extends State<EscalaCreationPage> {

  Escala escala;

  _EscalaCreationPageState(this.escala);

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
    );
  }
}
