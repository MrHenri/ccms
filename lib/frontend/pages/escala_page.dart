import 'package:ccms/backend/models/calendar.dart';
import 'package:ccms/frontend/escala_widgets/equipe_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class EscalaPage extends StatefulWidget {
  @override
  _EscalaPageState createState() => _EscalaPageState();
}

class _EscalaPageState extends State<EscalaPage> {
  DateTime _date;
  Calendar _calendar = Calendar();
  List<EquipeTable> listEquipe = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: ListView.builder(
            itemCount: listEquipe.length,
            itemBuilder: (BuildContext ctxt, int index){
              return EquipeListTable(ctxt, index);
            }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            listEquipe.add(EquipeTable());
            setState(() {});
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget EquipeListTable(BuildContext ctxt, int index){
    return Container(
      key: UniqueKey(),
      margin: EdgeInsets.fromLTRB(8, 8, 8, 35),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 3,
            )
          ]),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 3,
                        )
                      ]),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28, letterSpacing: 2, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Equipe",
                        labelStyle: TextStyle(
                          fontSize: 18,
                        )),
                  ),
                ),
              ),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 3,
                        )
                      ]),
                  child: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: (){
                      setState(() {
                        print(listEquipe[index].key);
                        print(listEquipe.length);
                        listEquipe.removeAt(index);
                      });
                    },
                  ),
                )
            ],
          ),
          new EquipeTable(),
        ],
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
