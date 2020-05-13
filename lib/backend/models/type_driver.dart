import 'package:date_format/date_format.dart';

enum TypeDriver{
 None,
 A,
 B,
 AB,
 Nao_Habilitado,
}

String typeDriverToString(Object object) {
 switch(object){
  case (TypeDriver.A):
   return 'A';
  case (TypeDriver.B):
   return 'B';
  case (TypeDriver.Nao_Habilitado):
   return 'Não habilitado';
  case (TypeDriver.AB):
   return 'AB';
  default:
   return 'Não informado';
 }
}


