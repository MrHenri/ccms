import 'package:ccms/backend/models/user.dart';
import 'package:ccms/backend/user_type.dart';
import 'dart:html';

class UserGroup {
  //attributes
  List <User> _userGroup = new List(7);
  User _groupLeader;
  bool _onService = false;

  //constructor
  UserGroup(this._groupLeader);

  //getters
  User getLeader(){
    return this._groupLeader;
  }

  List <User> getUserGroup(){
    return this._userGroup;
  }

  //methods
  void addAllMembers(User leader, User servant1, User servant2, User servant3, User servant4){
    '''Adds all members of a group checking if the first one is a leader.''';

    if (leader.userType == UserType.leader){
      this._groupLeader = leader;
      for (User i in [servant1, servant2, servant3, servant4, leader]){
        this._userGroup.add(i);
        i.isInGroup = true;
      }
    }else {
      window.console.error("The user informed isn't a leader.");
      //need to throw an error or an exception
    }
  }

  void addServant(User servant){
    '''Add a servant to group and ensures that leader keep at last of list.''';
    if ((this._userGroup.length < 7) && (servant.userType == UserType.servant) && (!servant.isInGroup)){
      User _leader = this._userGroup.removeLast();
      this._userGroup.add(servant);
      servant.isInGroup = true;
      this._userGroup.add(_leader);
    } else {
      window.console.error("The user informed isn't a servant, this group is full or the servant is in another group.");
      //need to throw an error or an exception
    }
  }

  void removeAllMembers(){
    '''Remove all members and set atribute isInGroup of each one as false''';
    for (int i = 0; i < this._userGroup.length; i++ ){
      this._userGroup[i].isInGroup = false;
    };
    this._userGroup = new List(7);
  }

  void removeMember(User member){
    '''Receive a member as a parameter, check if him is on this group, and remove him if is not a leader''';
    if ((this._userGroup.contains(member)) && (member.userType != UserType.leader)) {
      this._userGroup.remove(member);
      member.isInGroup = false;
    }else {
      window.console.error("The user informed isn't in this group or he is a leader.");
      //need to throw an error or an exception
    };
  }

  void changeLeader(User newLeader){
    '''Remove a leader from a group, receives a newLeader as a parameter setting him as new group leader''';
    this.getLeader().isInGroup = false;
    this._userGroup.removeLast(); //the leader will be always the last one in list
    this._userGroup.add(newLeader);
    newLeader.isInGroup = true;
  }

}
