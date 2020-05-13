import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class EquipeCreator extends StatefulWidget {
  @override
  _EquipeCreatorState createState() => _EquipeCreatorState();
}

class _EquipeCreatorState extends State<EquipeCreator> {
  List<String> listNames = [];
  List<String> listCellfone = [];
  final TextEditingController name = new TextEditingController();
  final TextEditingController cellphone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
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
            Container(
              margin: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 3,
                    )
                  ]),
              child: FlatButton(
                onPressed: (){
                  createAlertDialog(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Adicionar Líder",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.5
                      ),
                    ),
                    Icon(Icons.person_add,)
                  ],
                ),
              )
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
                      FocusScope.of(context).requestFocus(FocusNode());
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
              child: Container(
                margin: EdgeInsets.all(8),
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
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 16, 8, 20),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 3,
                          )
                        ]),
                    child: FlatButton(
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(child: Text("Delete", textAlign: TextAlign.center,)),
                          Icon(Icons.delete)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 16, 8, 20),
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
                    child: FlatButton(
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(child: Text("Salvar", textAlign: TextAlign.center,)),
                          Icon(Icons.save)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Escolha um líder de escala", style: TextStyle(fontSize: 16),),
      );
    });
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
