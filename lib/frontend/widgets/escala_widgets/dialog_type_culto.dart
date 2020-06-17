import 'package:ccms/backend/models/culto_type.dart';
import 'package:ccms/backend/models/escala.dart';
import 'package:ccms/frontend/pages/escala_creation_page.dart';
import 'package:flutter/material.dart';
import 'package:ccms/frontend/widgets/escala_widgets/dialog_month_escala.dart';

class PopTypeCulto{

  final BuildContext context;
  final Escala escala;

  PopTypeCulto({this.escala, this.context});

  popTypeCulto() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TypeCulto culto = TypeCulto.Celebracao;
          escala.typeCulto = culto;

          return AlertDialog(
              title: Text("Escolha o tipo de culto"),
              actions: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    PopMonthsEscala(context: context).popMonthsEscala();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return EscalaCreationPage(escala: escala,);
                    }));
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
                                escala.typeCulto = value;
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
                                escala.typeCulto = culto;
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
                                escala.typeCulto = culto;
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
    }

