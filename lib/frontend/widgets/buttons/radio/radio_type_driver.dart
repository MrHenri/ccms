import 'package:flutter/material.dart';

class RadioTypeDriver extends StatefulWidget {

  final List<Widget> radioDriver;

  const RadioTypeDriver({Key key, this.radioDriver}) : super(key: key);

  @override
  _RadioTypeDriverState createState() => _RadioTypeDriverState();
}

class _RadioTypeDriverState extends State<RadioTypeDriver> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.radioDriver,
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
}