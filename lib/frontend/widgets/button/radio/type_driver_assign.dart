import 'package:ccms/frontend/widgets/button/radio/radio_type_driver.dart';
import 'package:flutter/material.dart';

class TypeDriver extends StatefulWidget {
  @override
  _TypeDriverState createState() => _TypeDriverState();
}

class _TypeDriverState extends State<TypeDriver> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 24),
      child: Container(
        width: MediaQuery.of(context).size.width,
        //height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 3,
            )
          ]
        ), 
        child: Column(
          children: <Widget>[
            SizedBox(height: 8,),
            Text(
              "Tipo de Habilitação", 
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
              ),
            ),
            RadioTypeDriver(),
          ],
        ),
      ),
    );
  }
}