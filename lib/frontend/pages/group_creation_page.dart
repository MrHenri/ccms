import 'package:ccms/backend/models/user_group.dart';
import 'package:ccms/backend/services/user_management.dart';
import 'package:ccms/frontend/widgets/creation_group_widgets/addmember_button.dart';
import 'package:ccms/frontend/widgets/creation_group_widgets/group_listview.dart';
import 'package:ccms/frontend/widgets/creation_group_widgets/register_group_button.dart';
import 'package:ccms/frontend/widgets/creation_group_widgets/stream_builder_leader.dart';
import 'package:ccms/frontend/widgets/creation_group_widgets/stream_builder_servant.dart';
import 'package:flutter/material.dart';

class GroupCreationPage extends StatefulWidget {
  @override
  _GroupCreationState createState() => _GroupCreationState();
}

class _GroupCreationState extends State<GroupCreationPage> {
  final watchGroupName = TextEditingController();
  final snapshotLeaders = UserManagement().snapshotLeaders();
  final snapshotServants = UserManagement().snapshotServants();
  UserGroup currentUserGroup = UserGroup();

  @override
  void initState() {
    super.initState();
    watchGroupName.addListener(textListener);
  }

  textListener() => setState(() {});

  updateGroupList(UserGroup userGroup) {
    setState(() {
      currentUserGroup = userGroup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Criação de Equipe",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.blue,
          elevation: 16,
          leading: Container(
            margin: EdgeInsets.all(6),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.group_add,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(8, 16, 8, 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                      )
                    ]),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: watchGroupName,
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Equipe",
                      labelStyle: TextStyle(
                        fontSize: 18,
                      )),
                ),
              ),
              GroupListView(
                  currentUserGroup: currentUserGroup,
                  userGroupRefresh: updateGroupList),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(8, 16, 8, 20),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 3,
                              )
                            ]),
                        child: AddMemberButton(showSelectLeaders: showSelectLeaders, showSelectServant: showSelectServant, currentUserGroup: currentUserGroup,)
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(8, 16, 8, 20),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 3,
                            )
                          ]),
                      child: RegisterGroupButton(currentUserGroup: currentUserGroup,groupName: watchGroupName.text),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }



  showSelectLeaders() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Selecione um líder"),
              content: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilderLeader(currentUserGroup: currentUserGroup, userGroupRefresh: updateGroupList),
              ));
        });
  }

  showSelectServant() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Selecione os Servos"),
              content: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilderServant(currentUserGroup: currentUserGroup, userGroupRefresh: updateGroupList,),
              ));
        });
  }
}
