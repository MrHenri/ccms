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
          popMonthsEscala();
        },
        child: Icon(Icons.add),
      ),
    );
  }


  popTypeCulto(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          actions: <Widget>[
            RaisedButton(
              onPressed: () => changePop(false),
              child: Icon(Icons.arrow_back),
            ),
            RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: Icon(Icons.arrow_forward),
            ),
          ],
        );
      }
    );
  }

  changePop(bool popDialog){
    if(popDialog){
      Navigator.pop(context);
      popTypeCulto();
    }else{
      Navigator.pop(context);
      popMonthsEscala();
    }
  }

  popMonthsEscala() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: <Widget>[
              RaisedButton(
                onPressed: () => changePop(true),
                child: Icon(Icons.arrow_forward),
              )
            ],
              title: Text("Selecione um mês"),
              content: Container(
                width: MediaQuery.of(context).size.width,
                child: GridView.count(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 6,
                        shrinkWrap: true,
                        children: List.generate(12, (index) {
                          return RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            onPressed: (){
                            },
                            color: Colors.green,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                  meses[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          );
                        })
                    ),
              ),
          );
        });
  }
}
