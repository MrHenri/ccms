import 'package:flutter/material.dart';

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
        onPressed: (){
          showSelectLeaders();
        },
        child: Icon(Icons.add),
      ),
    );
  }
  showSelectLeaders() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Preencha os campos"),
              content: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                  ],
                ),
              ));
        });
  }
}
