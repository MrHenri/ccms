import 'package:flutter/material.dart';

class EscalaCreationPage extends StatefulWidget {
  @override
  _EscalaCreationPageState createState() => _EscalaCreationPageState();
}

class _EscalaCreationPageState extends State<EscalaCreationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Criação de Escala",
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
