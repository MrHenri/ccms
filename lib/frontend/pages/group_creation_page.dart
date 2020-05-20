import 'package:ccms/backend/models/user.dart';
import 'package:ccms/backend/models/user_group.dart';
import 'package:ccms/backend/services/user_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final UserGroup currentUserGroup = UserGroup();

  @override
  void initState() {
    super.initState();
    watchGroupName.addListener(textListener);
  }

  textListener() => setState(() {});

  List<User> _getMembers() {
    ///Return a list of recent added members.
    List<User> members = [];
    if (currentUserGroup.getLeader().getName() != null) {
      members = [currentUserGroup.getLeader()] + currentUserGroup.getServants();
    } else {
      members = currentUserGroup.getServants();
    }
    return members;
  }

  Future _getMembersDetails() async {
    ///A future function used to return members information.
    var result = _getMembers();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8),
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
                _groupListView(),
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

  Widget _buildLeaders() {
    ///Returns a list view based on a stream data of all leaders in database.
    return StreamBuilder(
        stream: snapshotLeaders,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text('Carregando líderes...');
              default:
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot leaderSnapshot =
                        snapshot.data.documents[index];
                    return ListTile(
                      title: Text('${leaderSnapshot.data['name']}'),
                      subtitle: Text(
                          'Célula: ${leaderSnapshot.data['célula']}\nHabilitação: ${leaderSnapshot.data['type_driver']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.add_box),
                        iconSize: 40,
                        color: Colors.indigo,
                        onPressed: () {
                          setState(() {
                            settingLeader(leaderSnapshot);
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                    );
                  },
                );
            }
          }
        });
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
                child: _buildLeaders(),
              ));
        });
  }

  Widget _buildServants() {
    ///Returns a list view based on a stream data of all servants in database.
    return StreamBuilder(
        stream: snapshotServants,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text('Carregando servos...');
              default:
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot servantSnapshot =
                        snapshot.data.documents[index];
                    return ListTile(
                      title: Text('${servantSnapshot.data['name']}'),
                      subtitle: Text(
                          'Célula: ${servantSnapshot.data['célula']}\nHabilitação: ${servantSnapshot.data['type_driver']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.add_box),
                        iconSize: 40,
                        color: Colors.indigo,
                        onPressed: () {
                          setState(() {
                            //this condition is to check if the servant was selected previously
                            if (currentUserGroup.searchServant(servantSnapshot.data['email'])) {
                              _showFlushBar('Atenção:', 'Este servo já foi adicionado.');
                            } else {
                              settingServant(servantSnapshot);
                              Navigator.of(context).pop();
                            }
                          });
                        },
                      ),
                    );
                  },
                );
            }
          }
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
                child: _buildServants(),
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

  Widget _groupListView() {
    ///Builds a list view of all members recently added to the new group.
    return FutureBuilder(
        future: _getMembersDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
//            case ConnectionState.waiting:
//              return Text('Carregando membros');
            //Here is where on null method is called
            default:
              return Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 0,
                      )
                    ]),
                child: ListView.separated(
                    shrinkWrap: true,
                    controller: ScrollController(keepScrollOffset: false),
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.grey),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            currentUserGroup.removeMember(snapshot.data[index]);
                          });
                        },
                        background: Container(
                          color: Colors.red,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: ListTile(
                            title: Text('${snapshot.data[index].getName()}'),
                            subtitle: Text(
                                'Célula: ${snapshot.data[index].getCelula()}\n'
                                'Habilitação: ${snapshot.data[index].getTypeDriver()}\n'
                                'Telefone: ${snapshot.data[index].getCellPhone()}'),
                          ),
                        ),
                      );
                    }),
              );
          }
        });
  }

  FlatButton addMemberButton() {
    ///Return a button on screen, which statement will depend if the leader was selected or not, or if the group is full.

    if (currentUserGroup.getLeader().getName() == null) {
      //this conditional will check if there is a leader already selected
      return FlatButton(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        onPressed: () {
          setState(() {_showSelectLeaders();});
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
        setState(() {_showSelectServant();});
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
          _showFlushBar('Atenção:', 'O nome do grupo deve possuir no máximo 18 caracteres.');
        } else {
          currentUserGroup.setGroupName(watchGroupName.text);
          //UserGroupManagement().storeNewUserGroup(this.currentUserGroup);
          //Uncomment line above to REAL STORAGE OF THE GROUP DATA ON FIREBASE.
          _showFlushBar('Processo concluído.', 'O grupo foi criado com sucesso.');
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

  void settingLeader(leaderSnapshot) {
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

  void settingServant(servantSnapshot) {
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
