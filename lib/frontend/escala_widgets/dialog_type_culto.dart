import 'package:ccms/backend/models/culto_type.dart';
import 'package:ccms/frontend/escala_widgets/popup_add_escala.dart';
import 'package:flutter/material.dart';

class PopTypeCulto{

  final BuildContext context;

  PopTypeCulto({this.context});

  popTypeCulto() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TypeCulto culto;

          return AlertDialog(
              title: Text("Escolha o tipo de culto"),
              actions: <Widget>[
                RaisedButton(
                  onPressed: () => PopUpAddEscala(context).addEscalaDialog("months"),
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
                                //escala.culto = culto;
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
                                //escala.culto = culto;
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
                                //escala.culto = culto;
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
