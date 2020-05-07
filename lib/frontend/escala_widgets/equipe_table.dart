import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class EquipeTable extends StatefulWidget {
  @override
  _EquipeTableState createState() => _EquipeTableState();
}

class _EquipeTableState extends State<EquipeTable> {
  List<String> listNames = [];
  List<String> listCellfone = [];
  final TextEditingController name = new TextEditingController();
  final TextEditingController cellphone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    UniqueKey();
    return Container(
      height: 340,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey[600],
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
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Servo",
                        labelStyle: TextStyle(
                          fontSize: 18,
                        )),
                    controller: name,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey[600],
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
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Telefone",
                        labelStyle: TextStyle(
                          fontSize: 18,
                        )),
                    controller: cellphone,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 3,
                      )
                    ]),
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    listNames.add(name.text);
                    listCellfone.add(cellphone.text);
                    name.clear();
                    cellphone.clear();
                    setState(() {});
                  },
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: listNames.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  final itemName = listNames[index];
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      setState(() {
                        listNames.removeAt(index);
                        listCellfone.removeAt(index);
                      });
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("$itemName dismissed"),
                      ));
                    },
                    background: Container(
                      color: Colors.red,
                    ),
                    child: buildBody(ctxt, index),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext ctxt, int index) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                listNames[index],
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                listCellfone[index],
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
