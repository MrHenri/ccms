import 'package:ccms/frontend/login_widgets/buttons/radio/radio_type_driver.dart';
import 'package:flutter/material.dart';

class TypeDriver extends StatefulWidget {

  final List<Widget> radioDriver;

  const TypeDriver({Key key, this.radioDriver}) : super(key: key);


  @override
  _TypeDriverState createState() => _TypeDriverState();
}

class _TypeDriverState extends State<TypeDriver> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30, left: 30),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 3,
            )
          ]),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Text(
            "Tipo de Habilitação",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 15,
            ),
          ),
          RadioTypeDriver(radioDriver: widget.radioDriver),
        ],
      ),
    );
  }
}
