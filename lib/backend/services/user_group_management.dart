import 'package:ccms/backend/models/user_group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserGroupManagement {

  final CollectionReference userGroupCollection = Firestore.instance.collection('/user_group');
  final CollectionReference userCollection = Firestore.instance.collection('/user');

  Future storeNewUserGroup(UserGroup user_group) async {
    QuerySnapshot _leaderSnapshot = await userCollection.
    where('email', isEqualTo: user_group.getLeader().getEmail()).getDocuments();

    final _servants = user_group.getServants();

    return await userGroupCollection.document().setData({
      'group_name': user_group.getName(),
      'group_leader': _leaderSnapshot,

    });
  }
}