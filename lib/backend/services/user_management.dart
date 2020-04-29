import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class UserManagement {

  final String uid;
  UserManagement({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('/user');

  Future storeNewUser(User user) async {
    return await userCollection.document(uid).setData({
      'name': user.name,
      'email': user.email,
      'cellPhone': user.cellphone,
      'célula': user.celula,
      'discipulador': user.discipulador,
      'birthday': user.birthday.toString(),
      'type_driver': user.typeDriver.toString(),
    });
  }
}