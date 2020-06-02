import 'package:ccms/backend/models/culto_type.dart';
import 'package:ccms/backend/models/escala.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopUpAddEscala {
  Escala escala = Escala();
  String mes;
  List<String> meses = [
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
  final BuildContext context;

  PopUpAddEscala(this.context);

  popTypeCulto() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TypeCulto culto;

          return AlertDialog(
              title: Text("Escolha o tipo de culto"),
              actions: <Widget>[
                RaisedButton(
                  onPressed: () => changePop(false),
                  child: Icon(Icons.arrow_back),
                ),
                RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/escalaCreationPage');
                  },
                  child: Text("Confirmar"),
                ),
              ],
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          RadioListTile<TypeCulto>(
                            title: const Text('Celebração'),
                            value: TypeCulto.Celebracao,
                            groupValue: culto,
                            onChanged: (TypeCulto value) {
                              setState(() {
                                culto = value;
                                escala.culto = culto;
                              });
                            },
                          ),
                          RadioListTile<TypeCulto>(
                            title: const Text('Escola de Discíulo'),
                            value: TypeCulto.Escola_De_Discipulo,
                            groupValue: culto,
                            onChanged: (TypeCulto value) {
                              setState(() {
                                culto = value;
                                escala.culto = culto;
                              });
                            },
                          ),
                          RadioListTile<TypeCulto>(
                            title: const Text('Evento'),
                            value: TypeCulto.Evento,
                            groupValue: culto,
                            onChanged: (TypeCulto value) {
                              setState(() {
                                culto = value;
                                escala.culto = culto;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
        });
  }

  changePop(bool popDialog) {
    if (popDialog) {
      Navigator.pop(context);
      popTypeCulto();
    } else {
      Navigator.pop(context);
      popMonthsEscala();
    }
  }

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
                        mes = meses[index];
                        changePop(true);
                      },
                      color: Colors.green,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          meses[index],
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
