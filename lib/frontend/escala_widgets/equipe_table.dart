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
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                listNames.add(name.text);
                listCellfone.add(cellphone.text);
                name.clear();
                cellphone.clear();
                setState(() {});
              },
              
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: listNames.length,
              itemBuilder: (BuildContext ctxt, int index) {
                final itemName = listNames[index];
                return Dismissible(
                  key: Key(itemName),
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
    );
  }

  Widget buildBody(BuildContext ctxt, int index) {
    return new Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                listNames[index],
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: Colors.orange,
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
