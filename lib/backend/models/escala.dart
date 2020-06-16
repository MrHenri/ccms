import 'package:ccms/backend/models/culto_type.dart';
import 'package:ccms/backend/models/turno.dart';

class Escala{

  String name;
  String month;
  TypeCulto typeCulto;
  List<Turno> turnos = List<Turno>();
  String observations;

  Escala({this.name, this.month, this.typeCulto, this.turnos, this.observations});

}