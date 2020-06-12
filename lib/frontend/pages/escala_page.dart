import 'package:ccms/frontend/escala_widgets/popup_add_escala.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EscalaPage extends StatefulWidget {
  @override
  _EscalaPageState createState() => _EscalaPageState();
}

class _EscalaPageState extends State<EscalaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Escalas Disponíveis",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
        elevation: 16,
        leading: Container(
          margin: EdgeInsets.all(6),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.event,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PopUpAddEscala(context).addEscalaDialog("");
        },
        child: Icon(Icons.add),
      ),
    );
  }
  }

