import 'package:ccms/backend/models/escala.dart';
import 'package:ccms/frontend/escala_widgets/dialog_type_culto.dart';
import 'package:flutter/material.dart';

class PopMonthsEscala {
  final BuildContext context;
  Escala escala = Escala();

  List<String> months = [
    "Janeiro",
    "Fervereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ];

  PopMonthsEscala({this.context});

  popMonthsEscala() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Selecione um mês"),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount:
                      MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 6,
                  shrinkWrap: true,
                  children: List.generate(12, (index) {
                    return RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        escala.month = months[index];
                        Navigator.pop(context);
                        PopTypeCulto(escala: escala, context: context).popTypeCulto();
                      },
                      color: Colors.blue,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          months[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  })),
            ),
          );
        });
  }
}
