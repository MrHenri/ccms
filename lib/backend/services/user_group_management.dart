import 'package:ccms/backend/models/user_group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserGroupManagement {

  final CollectionReference userGroupCollection = Firestore.instance.collection('/user_group');
  final CollectionReference userCollection = Firestore.instance.collection('/user');

  void storeNewUserGroup(UserGroup userGroup) async {
    ///Receives an userGroup object and stores its references in user_group collection from firebase.

    List<DocumentReference> _servantsReferences = [];
    userGroup.getServants().forEach((user) => _servantsReferences.add(user.getFirebaseReference()));

    await userGroupCollection.document().setData({
      'group_name': userGroup.getGroupName(),
      'group_leader': userGroup.getLeader().getFirebaseReference(),
      'group_servants': _servantsReferences,
    });
    _setIsInGroupTrue(userGroup);
  }

  void _setIsInGroupTrue(UserGroup userGroup) {
    userCollection.document(
        userGroup.getLeader().getFirebaseReference().documentID).updateData(
        {'is_in_group': true});

    userGroup.getServants().forEach(
            (user) => userCollection.document(
            user.getFirebaseReference().documentID).updateData(
            {'is_in_group': true}));
  }

  void deleteUserGroup(UserGroup userGroup){
    _setIsInGroupFalse(userGroup);
    userGroupCollection.document(userGroup.getGroupReference().documentID).delete();
  }

  void _setIsInGroupFalse(UserGroup userGroup) {
    userCollection.document(
        userGroup.getLeader().getFirebaseReference().documentID).updateData(
        {'is_in_group': false});

    userGroup.getServants().forEach(
            (user) => userCollection.document(
            user.getFirebaseReference().documentID).updateData(
            {'is_in_group': false}));
  }
}