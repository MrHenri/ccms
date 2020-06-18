import 'package:ccms/backend/models/user_group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserGroupManagement {

  final CollectionReference userGroupCollection = Firestore.instance.collection('/user_group');
  final CollectionReference userCollection = Firestore.instance.collection('/user');

  void storeNewUserGroup(UserGroup userGroup) async {
    ///Receives an userGroup object and stores its ID in user_group collection from firebase.

    void _setIsInGroupTrue(UserGroup userGroup) {
      ///Update isInGroup status from an UserGroup object.
      userCollection.document(
          userGroup.getLeader().getDocumentID()).updateData(
          {'is_in_group': true});

      userGroup.getServants().forEach(
              (user) => userCollection.document(
              user.getDocumentID()).updateData(
              {'is_in_group': true}));
    }

    List<String> _servantsID = [];
    userGroup.getServants().forEach((user) => _servantsID.add(user.getDocumentID()));

    await userGroupCollection.document().setData({
      'group_name': userGroup.getGroupName(),
      'group_leader': userGroup.getLeader().getDocumentID(),
      'group_servants': _servantsID,
    });
    _setIsInGroupTrue(userGroup);

  }

  void deleteUserGroup(UserGroup userGroup){
    ///Delete a group from an UserGroup object.

    void _setIsInGroupFalse(UserGroup userGroup) {
      ///Update isInGroup status by an UserGroup object.
      userCollection.document(
          userGroup.getLeader().getDocumentID()).updateData(
          {'is_in_group': false});

      userGroup.getServants().forEach(
              (user) => userCollection.document(
              user.getDocumentID()).updateData(
              {'is_in_group': false}));
    }

    _setIsInGroupFalse(userGroup);
    userGroupCollection.document(userGroup.getGroupID()).delete();
  }

  Stream<QuerySnapshot> snapshotGroups(){
    return this.userGroupCollection.snapshots();
  }

  Future<void> deleteGroupFromSnapshot(DocumentSnapshot groupSnapshot) async {
    ///Receives a document snapshot of a group and delete group data from database.
    List<String> _documentIDs = [];
    _documentIDs.add(groupSnapshot.data['group_leader']);
    groupSnapshot.data['group_servants'].forEach(
        (id) => _documentIDs.add(id.toString())
    );
    _documentIDs.forEach(
            (id) => userCollection.document(id).updateData(
            {'is_in_group': false}));
    userGroupCollection.document(groupSnapshot.documentID).delete();
  }
}

