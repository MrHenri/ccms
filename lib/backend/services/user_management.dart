import 'package:ccms/backend/models/type_driver.dart';
import 'package:ccms/backend/models/user_type.dart';
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
      'type_driver': typeDriverToString(user.typeDriver),
      'user_type': userTypeToString(user.userType),
      'is_in_group': user.isInGroup,
    });
  }

  Stream<QuerySnapshot> snapshotLeaders(){
    return this.userCollection.where('user_type', isEqualTo: 'leader').snapshots();
  }

  Stream<QuerySnapshot> snapshotServants(){
    return this.userCollection.where('user_type', isEqualTo: 'servant').snapshots();
  }

}