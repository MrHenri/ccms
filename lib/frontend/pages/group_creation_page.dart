import 'package:ccms/backend/dao/setting_members.dart';
import 'package:ccms/backend/models/user.dart';
import 'package:ccms/backend/models/user_group.dart';
import 'package:ccms/backend/services/user_management.dart';
import 'package:ccms/frontend/creation_group_widgets/group_listview.dart';
import 'package:ccms/frontend/creation_group_widgets/stream_builder_leader.dart';
import 'package:ccms/frontend/creation_group_widgets/stream_builder_servant.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
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
    return SafeArea(
      child: Scaffold(
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
                          child: addMemberButton()),
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
                        child: registerGroupButton(),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }



  void _showSelectLeaders() {
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

  void _showSelectServant() {
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

  Flushbar _showFlushBar(String title, String message) {
    String _title = title;
    String _message = message;
    return Flushbar(
      title: _title,
      message: _message,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  FlatButton addMemberButton() {
    ///Return a button on screen, which statement will depend if the leader was selected or not, or if the group is full.

    if (currentUserGroup.getLeader().getName() == null) {
      //this conditional will check if there is a leader already selected
      return FlatButton(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        onPressed: () {
          setState(() {
            _showSelectLeaders();
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Text(
              'Adicionar Líder',
              textAlign: TextAlign.center,
            )),
            Icon(Icons.person_add)
          ],
        ),
      );
    }
    return FlatButton(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      onPressed: () {
        setState(() {
          _showSelectServant();
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
              child: Text(
            'Adicionar Servo',
            textAlign: TextAlign.center,
          )),
          Icon(Icons.people)
        ],
      ),
    );
  }

  FlatButton registerGroupButton() {
    if (currentUserGroup.getLeader().getName() == null) {
      return FlatButton(
        onPressed: null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Text(
              "Concluir",
              textAlign: TextAlign.center,
            )),
            Icon(Icons.save)
          ],
        ),
      );
    }
    return FlatButton(
      onPressed: () {
        if (watchGroupName.text.length > 18) {
          _showFlushBar('Atenção:',
              'O nome do grupo deve possuir no máximo 18 caracteres.');
        } else {
          currentUserGroup.setGroupName(watchGroupName.text);
          //UserGroupManagement().storeNewUserGroup(this.currentUserGroup);
          //Uncomment line above to REAL STORAGE OF THE GROUP DATA ON FIREBASE.
          _showFlushBar(
              'Processo concluído.', 'O grupo foi criado com sucesso.');
          Future.delayed(Duration(milliseconds: 1500), () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, '/groupCreationPage');
            //this line need to be modified to route the page to the group list page (not implemented yet)
          });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
              child: Text(
            "Concluir",
            textAlign: TextAlign.center,
          )),
          Icon(Icons.save)
        ],
      ),
    );
  }
}
