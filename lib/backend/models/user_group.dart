import 'package:ccms/backend/models/user.dart';
import 'package:ccms/backend/models/user_type.dart';

class UserGroup {
  ///attributes
  String _groupName;
  List <User> _servants = [];
  User _groupLeader;
  bool _onService = false;

  ///getters
  String getName() => this._groupName;

  User getLeader() => this._groupLeader;

  List <User> getServants() => this._servants;

  ///methods

  void addAllMembers(User leader, User servant1, User servant2, User servant3, User servant4, User servant5, User servant6){
    ///Adds all members of a group checking if the first one is a leader.
    if (leader.userType == UserType.leader){
      this._groupLeader = leader;
      this._groupLeader.isInGroup = true;
      for (User i in [servant1, servant2, servant3, servant4, servant5, servant6]){
        this._servants.add(i);
        i.isInGroup = true;
      }
    }else {
      //need to throw an error or an exception
    }
  }

  void addServant(User servant){
    ///Add a servant to group list.
    if ((this._servants.length < 6) && (servant.userType == UserType.servant) && (!servant.isInGroup)){
      this._servants.add(servant);
      servant.isInGroup = true;
    } else {
      //need to throw an error or an exception
    }
  }

  void removeAllMembers(){
    ///Remove all members and set attribute isInGroup of each one as false.
    for (int i = 0; i < this._servants.length; i++ ){
      this._servants[i].isInGroup = false;
    }
    this._servants = [];
    this._groupLeader.isInGroup = false;
    this._groupLeader = null;
  }

  void removeMember(User member){
    ///Receive a member as a parameter, check if him is on this group, and remove him if is not a leader.
    if ((this._servants.contains(member)) && (member.userType == UserType.servant)) {
      this._servants.remove(member);
      member.isInGroup = false;
    }else if (this._groupLeader == member){
      this._groupLeader.isInGroup = false;
      this._groupLeader = null;
    }else{
      //need to throw an exception
    }
  }

  void setLeader(User newLeader){
    newLeader.isInGroup = true;
    this._groupLeader = newLeader;
  }

  void removeLeader(){
    this._groupLeader.isInGroup = false;
    this._groupLeader = null;
  }

}
