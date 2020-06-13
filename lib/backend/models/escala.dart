import 'package:ccms/backend/models/culto_type.dart';
import 'package:ccms/backend/models/turno.dart';

class Escala{

  String month;
  TypeCulto typeCulto;
  List<Turno> turnos;
  String observations;

  Escala({this.month, this.typeCulto, this.turnos, this.observations});
}