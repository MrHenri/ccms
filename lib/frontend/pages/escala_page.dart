import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EscalaPage extends StatefulWidget {
  @override
  _EscalaPageState createState() => _EscalaPageState();
}

class _EscalaPageState extends State<EscalaPage> {

  List<String> meses = ["JANEIRO", "FERVEREIRO", "MARÇO", "ABRIL", "MAIO", "JUNHO", "JULHO", "AGOSTO", "SETEMBO", "OUTUBRO", "NOVEMBRO", "DEZEMBRO"];

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
              title: Text("Selecione um mês"),
              content: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: List.generate(12, (index) {
                    return Container(
                      color: Colors.brown,
                      child: Text(meses[index]),
                    );
                  })
                ),
              )
          );
        });
  }
}
