import 'package:flutter/material.dart';

class AdicionarGroupContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/3,
      height: 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 0),
              color: Color.fromRGBO(127, 140, 141, 0.5),
              spreadRadius: 2)
        ],
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          children: <Widget>[
            Icon(Icons.add),
            SizedBox(width: 8),
            Text("Adicionar Grupo"),
          ],
        ),
      ),
    );
  }
}
