import 'package:ccms/backend/models/user.dart';
import 'package:ccms/backend/models/user_group.dart';
import 'package:ccms/backend/services/user_group_management.dart';
import 'package:ccms/backend/services/user_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupCreationPage extends StatefulWidget {
  @override
  _GroupCreationState createState() => _GroupCreationState();
}

class _GroupCreationState extends State<GroupCreationPage>{
  final watchGroupName = TextEditingController();
  final snapshotLeaders = UserManagement().snapshotLeaders();
  final snapshotServants = UserManagement().snapshotServants();
  final UserGroup currentUserGroup = UserGroup();

  @override
  void initState(){
    super.initState();
    watchGroupName.addListener(textListener);
  }

  textListener() => setState(() {
  });

  List<User> _getMembers(){
    ///Return a list of recent added members.
    List<User> members = [];
    if(currentUserGroup.getLeader().getName() != null){
      members = [currentUserGroup.getLeader()] + currentUserGroup.getServants();
    }else{
      members = currentUserGroup.getServants();
    }
    return members;
  }

  Future _getMembersDetails() async {
    ///A future function used to return members information.
    var result = _getMembers();
    return result;
  }

  Widget _buildLeaders(){
    ///Returns a list view based on a stream data of all leaders in database.
    return StreamBuilder(
        stream: snapshotLeaders,
        builder: (BuildContext context, AsyncSnapshot snapshot)
        {
          {
            if (snapshot.hasError)
            { return Text('Error: ${snapshot.error}');

            } switch (snapshot.connectionState){
              case ConnectionState.waiting: return Text('Carregando líderes...');
              default:
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey
                  ),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index){
                    DocumentSnapshot leaderSnapshot = snapshot.data.documents[index];
                    return ListTile(
                      title: Text('${leaderSnapshot.data['name']}'),
                      subtitle: Text('Célula: ${leaderSnapshot.data['célula']}\nHabilitação: ${leaderSnapshot.data['type_driver']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.add_box),
                        iconSize: 40,
                        color: Colors.indigo,
                        onPressed: (){
                          setState(() {
                            //setting the leader information
                            currentUserGroup.getLeader().setName(leaderSnapshot.data['name']);
                            currentUserGroup.getLeader().setEmail(leaderSnapshot.data['email']);
                            currentUserGroup.getLeader().setCellphone(leaderSnapshot.data['cellPhone']);
                            currentUserGroup.getLeader().setDiscipulador(leaderSnapshot.data['discipulador']);
                            currentUserGroup.getLeader().setCelula(leaderSnapshot.data['célula']);
                            currentUserGroup.getLeader().setTypeDriver(leaderSnapshot.data['type_driver']);
                            currentUserGroup.getLeader().setFirebaseReference(leaderSnapshot.reference);
                            currentUserGroup.getLeader().assignLeadership();

                            //returning to previous page
                            setState(() {
                              Navigator.of(context).pop();
                            });

                          });
                        },
                      ),
                    );
                  },
                );
            }
          }
        }
    );
  }

  void _leadersPage(){
    ///Creates a new page route in a Scaffold widget, loading all leaders in the new page.
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder:(BuildContext context){
          return Scaffold(
            appBar: AppBar(title: Text('Líderes'), backgroundColor: Colors.indigo),
            body: SingleChildScrollView(
              child: _buildLeaders(),
            ),
          );
        }
      )
    );
  }

  Widget _buildServants(){
    ///Returns a list view based on a stream data of all servants in database.
    return StreamBuilder(
        stream: snapshotServants,
        builder: (BuildContext context, AsyncSnapshot snapshot)
        {
          {
            if (snapshot.hasError)
            { return Text('Error: ${snapshot.error}');

            } switch (snapshot.connectionState){
              case ConnectionState.waiting: return Text('Carregando servos...');
              default:
                return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                    color: Colors.grey
                  ),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index){
                    DocumentSnapshot servantSnapshot = snapshot.data.documents[index];
                    return ListTile(
                      title: Text('${servantSnapshot.data['name']}'),
                      subtitle: Text('Célula: ${servantSnapshot.data['célula']}\nHabilitação: ${servantSnapshot.data['type_driver']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.add_box),
                        iconSize: 40,
                        color: Colors.indigo,
                        onPressed: (){
                          setState(() {
                            if (currentUserGroup.searchServant(servantSnapshot.data['email'])){
                              //this condition is to check if the servant was selected previously
                              setState(() {
                                _showFlushBar('Atenção:', 'Este servo já foi adicionado.');
                              });
                            }else {
                              //if the servant was selected, he a new user object is initialized with your corresponding data
                              User currentServant = User(isInGroup: false);

                              currentServant.setName(servantSnapshot.data['name']);
                              currentServant.setEmail(servantSnapshot.data['email']);
                              currentServant.setCellphone(servantSnapshot.data['cellPhone']);
                              currentServant.setDiscipulador(servantSnapshot.data['discipulador']);
                              currentServant.setCelula(servantSnapshot.data['célula']);
                              currentServant.setTypeDriver(servantSnapshot.data['type_driver']);
                              currentServant.setFirebaseReference(servantSnapshot.reference);

                              currentUserGroup.addServant(currentServant);
                              setState(() {
                                Navigator.of(context).pop();
                              });

                            }
                          });
                        },
                      ),
                    );
                  },
                );
            }
          }
        }
    );
  }

  Flushbar _showFlushBar(String title, String message){
    String _title = title;
    String _message = message;
    return Flushbar(
      title: _title,
      message: _message,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void _servantsPage(){
    ///Creates a new page route in a Scaffold widget, loading all servants in the new page.
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder:(BuildContext context){
          return Scaffold(
            appBar: AppBar(title: Text('Servos'), backgroundColor: Colors.indigo),
            body: SingleChildScrollView(
              child: _buildServants(),
            ),
          );
        }
    )
    );
  }

  Widget _groupListView(){
    ///Builds a list view of all members recently added to the new group.
    return FutureBuilder(
      future: _getMembersDetails(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
//          case ConnectionState.waiting:
//            return Text('Carregando membros');
        //Here is where on null method is called
          default:

            return ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${snapshot.data[index].getName()}'),
                    subtitle: Text('Célula: ${snapshot.data[index]
                        .getCelula()}\nHabilitação: ${snapshot.data[index]
                        .getTypeDriver()}'),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            currentUserGroup.removeMember(snapshot.data[index]);

                            setState(() {});
                          });
                        }),
                    );
                }
            );
          }
      });
  }



  FlatButton addMemberButton(){
    ///Return a button on screen, which statement will depend if the leader was selected or not, or if the group is full.

    if (currentUserGroup.getLeader().getName() == null) {
      //this conditional will check if there is a leader already selected
      return FlatButton(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        color: Colors.indigo,
        onPressed: (){
          setState(() {
            _leadersPage();
          });
        },
        child: Text('Adicionar Líder'),
      );

    } else if(_getMembers().length > 6){
      //this conditional will check if the group is full
      return FlatButton(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          disabledColor: Colors.white30,
          onPressed: null,
          child: Text('Adicionar Servo'),
      );
    }

    return FlatButton(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      color: Colors.indigo,
      onPressed: (){
        setState(() {
          _servantsPage();
        });
      },
      child: Text('Adicionar Servo'),
    );
  }

  FlatButton registerGroupButton(){
    if (currentUserGroup.getLeader().getName() == null){
      return FlatButton(
          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
          disabledColor: Colors.white30,
          onPressed: null,
          child: Text('Concluir')
      );
    }
    return FlatButton(
        padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
        color: Colors.indigo,
        onPressed: (){
          if (watchGroupName.text.length > 18){
            setState(() {
              _showFlushBar('Atenção:', 'O nome do grupo deve possuir no máximo 18 caracteres.');
            });
          }else{
            setState(() {
              currentUserGroup.setGroupName(watchGroupName.text);
              //UserGroupManagement().storeNewUserGroup(this.currentUserGroup);
              //Uncomment line above to REAL STORAGE OF THE GROUP DATA ON FIREBASE.
              setState(() {
                _showFlushBar('Processo concluído.', 'O grupo foi criado com sucesso.');
              });
              Future.delayed(Duration(milliseconds: 1500), (){
                setState(() {
                  Navigator.pushReplacementNamed(context, '/groupCreationPage');
                  //this line need to be modified to route the page to the group list page (not implemented yet)
                });
              });
            });
          }
        },
        child: Text('Concluir')
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Criar Grupo'), backgroundColor: Colors.indigo,),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(color: Colors.transparent),

            Row(
              children: <Widget>[

                SizedBox(width: 5),

                Center(
                  child: Text('Nome do Grupo: ',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: watchGroupName,
                  ),
                ),

                SizedBox(width: 10),
              ],
            ),

            _groupListView(),

            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                addMemberButton(),

                registerGroupButton(),

              ],
            )
          ],
        ),
      )
    );
  }
}