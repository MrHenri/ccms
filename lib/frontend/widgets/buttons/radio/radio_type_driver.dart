import 'package:flutter/material.dart';

class RadioTypeDriver extends StatefulWidget {
  @override
  _RadioTypeDriverState createState() => _RadioTypeDriverState();
}

class _RadioTypeDriverState extends State<RadioTypeDriver> {
    
  int typeDriver;

  @override
  void initState() {
    super.initState();
    typeDriver = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 1, 
              groupValue: typeDriver, 
              onChanged: (value){setSelectedRadio(value);}
            ),
            Radio(
              value: 2, 
              groupValue: typeDriver, 
              onChanged: (value){setSelectedRadio(value);}
            ),
            Radio(
              value: 3, 
              groupValue: typeDriver, 
              onChanged: (value){setSelectedRadio(value);}
            ),
            Radio(
              value: 4, 
              groupValue: typeDriver, 
              onChanged: (value){setSelectedRadio(value);}
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text("A"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text("B"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text("AB"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text("Não possui carteira de habilitação"),
            ),
          ],
        ),
      ],
    );
  }
  setSelectedRadio(int value){
      setState(() {
        typeDriver = value;
      });
    }
}