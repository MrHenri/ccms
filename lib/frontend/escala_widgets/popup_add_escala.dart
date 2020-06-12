import 'package:ccms/backend/models/escala.dart';
import 'package:ccms/frontend/escala_widgets/dialog_month_escala.dart';
import 'package:ccms/frontend/escala_widgets/dialog_type_culto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopUpAddEscala {
  final BuildContext context;

  PopUpAddEscala(this.context);

  addEscalaDialog(String whatsDialog) {
    switch (whatsDialog) {
      case "typeCelebration":
        {
          Navigator.pop(context);
          return PopTypeCulto(context: context).popTypeCulto();
        }
        break;

      case "months":
        {
          Navigator.pop(context);
          return PopMonthsEscala(context: context).popMonthsEscala();
        }
        break;

      default:
        {
          return PopMonthsEscala(context: context).popMonthsEscala();
        }
        break;
    }
  }
}
