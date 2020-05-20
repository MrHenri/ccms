import 'package:ccms/backend/models/type_driver.dart';
import 'package:ccms/backend/models/user_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String email;
  String password;
  String cellphone;
  String discipulador;
  String celula;
  DateTime birthday;
  TypeDriver typeDriver;
  DocumentReference reference;
  UserType userType = UserType.servant; //enum representing the userType (leader or servant)
  bool isInGroup = false;

  User({this.name, this.email, this.password, this.cellphone,
    this.discipulador, this.celula, this.birthday, this.typeDriver, this.isInGroup});

  User.login({this.email, this.password});

  ///getters
  String getName() => this.name;
  String getEmail() => this.email;
  String getTypeDriver() => typeDriverToString(this.typeDriver);
  String getUserType() => userTypeToString(this.userType);
  String getCellPhone() => this.cellphone;
  String getCelula() => this.celula;
  DocumentReference getFirebaseReference() => this.reference;

  ///setters
  void setName(name) => this.name = name;
  void setEmail(email) => this.email = email;
  void setCellphone(cellphone) => this.cellphone = cellphone;
  void setDiscipulador(discipulador) => this.discipulador = discipulador;
  void setCelula(celula) => this.celula = celula;
  void setTypeDriver(typeDriver){
   switch(typeDriver){
     case 'A':
       this.typeDriver = TypeDriver.A;
       break;
     case 'B':
       this.typeDriver = TypeDriver.B;
       break;
     case 'AB':
       this.typeDriver = TypeDriver.AB;
       break;
     case 'Não informado':
       this.typeDriver = TypeDriver.None;
       break;
     case 'Não habilitado':
       this.typeDriver = TypeDriver.Nao_Habilitado;
       break;
   }
  }
  void setFirebaseReference(reference) => this.reference = reference;

  void assignLeadership(){
    this.userType = UserType.leader;
  }

  void assignServitude(){
    this.userType = UserType.servant;
  }

}
