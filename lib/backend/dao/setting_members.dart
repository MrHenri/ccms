import 'package:ccms/backend/models/user.dart';
import 'package:ccms/backend/models/user_group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingMembers{

  final UserGroup currentUserGroup;

  SettingMembers({this.currentUserGroup});

  void settingLeader(DocumentSnapshot leaderSnapshot) {
    //setting the leader information
    currentUserGroup.getLeader().setName(leaderSnapshot.data['name']);
    currentUserGroup.getLeader().setEmail(leaderSnapshot.data['email']);
    currentUserGroup.getLeader().setCellphone(leaderSnapshot.data['cellPhone']);
    currentUserGroup.getLeader().setDiscipulador(leaderSnapshot.data['discipulador']);
    currentUserGroup.getLeader().setCelula(leaderSnapshot.data['célula']);
    currentUserGroup.getLeader().setTypeDriver(leaderSnapshot.data['type_driver']);
    currentUserGroup.getLeader().setFirebaseReference(leaderSnapshot.reference);
    currentUserGroup.getLeader().assignLeadership();
  }

  void settingServant(DocumentSnapshot servantSnapshot) {
    //setting the servant information
    User currentServant = User(isInGroup: false);

    currentServant.setName(servantSnapshot.data['name']);
    currentServant.setEmail(servantSnapshot.data['email']);
    currentServant.setCellphone(servantSnapshot.data['cellPhone']);
    currentServant.setDiscipulador(servantSnapshot.data['discipulador']);
    currentServant.setCelula(servantSnapshot.data['célula']);
    currentServant.setTypeDriver(servantSnapshot.data['type_driver']);
    currentServant.setFirebaseReference(servantSnapshot.reference);
    currentUserGroup.addServant(currentServant);
  }

}