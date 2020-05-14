
import 'package:ccms/backend/models/user.dart';
import 'package:ccms/backend/models/user_group.dart';
import 'package:ccms/backend/services/user_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final UserGroup newUserGroup = UserGroup();
  final User currentLeader = User();

  textListener() => setState(() {
  });

  List<User> _getMembers(){
    ///Return a list of recent added members.
    List<User> members = [];
    if((currentLeader.getName() != null) && (newUserGroup.getServants().isEmpty)){
      members = [currentLeader];
    }else if((currentLeader.getName() != null) && (newUserGroup.getServants().isNotEmpty)){
      members = [currentLeader] + newUserGroup.getServants();
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
                            currentLeader.setName(leaderSnapshot.data['name']);
                            currentLeader.setEmail(leaderSnapshot.data['email']);
                            currentLeader.setCellphone(leaderSnapshot.data['cellPhone']);
                            currentLeader.setDiscipulador(leaderSnapshot.data['discipulador']);
                            currentLeader.setCelula(leaderSnapshot.data['célula']);
                            currentLeader.setTypeDriver(leaderSnapshot.data['type_driver']);
                            currentLeader.setUid(leaderSnapshot.documentID);
                            currentLeader.assignLeadership();

                            //assigning the leader as a new group leader
                            this.newUserGroup.setLeader(currentLeader);

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
                            if (newUserGroup.searchServant(servantSnapshot.data['email'])){
                              //this condition is to check if the servant was selected previously
                              setState(() {
                                _showAlreadySelectedServantDialog();
                              });
                            }else {
                              User currentServant = User(
                                name: servantSnapshot.data['name'],
                                email: servantSnapshot.data['email'],
                                cellphone: servantSnapshot.data['cellPhone'],
                                discipulador: servantSnapshot.data['cellPhone'],
                                celula: servantSnapshot.data['célula'],
                                uid: servantSnapshot.data['uid'],
                              );
                              currentServant.setTypeDriver(servantSnapshot.data['type_driver']);
                              currentServant.setUid(servantSnapshot.documentID);

                              newUserGroup.addServant(currentServant);
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

  void _showAlreadySelectedServantDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Esse membro já foi adicionado ao grupo.', style: TextStyle(fontSize: 16)),
          contentPadding: EdgeInsets.fromLTRB(6, 4, 6, 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          actions: <Widget>[
            FlatButton(
              child: Text('Fechar'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
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
    return FutureBuilder(
      future: _getMembersDetails(),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          print('project snapshot data is: ${snapshot.data}');
          return Container();
        }
        return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(color: Colors.grey),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
          return ListTile(
              title: Text('${snapshot.data[index].getName()}'),
              subtitle: Text('Célula: ${snapshot.data[index].getCelula()}\nHabilitação: ${snapshot.data[index].getTypeDriver()}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                  setState(() {
                    newUserGroup.removeMember(snapshot.data[index]);
                    Navigator.of(context).popAndPushNamed('/groupCreationPage');
                });
              }),
            );
          }
        );
      },
    );
  }


  FlatButton addMemberButton(){
    ///Return a button in screen, which description will depend if the leader was selected or not.

    void setLeaderState(){
      setState(() {
        _leadersPage();
      });
    }

    void setServantState(){
      setState(() {
        _servantsPage();
      });
    }

    if (currentLeader.getName() == null) {
      //this conditional will be check if there is a leader already selected
      return FlatButton(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        color: Colors.indigo,
        onPressed: (){
          setLeaderState();
        },
        child: Text('Adicionar Líder'),
      );
    } else {

      return FlatButton(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        color: Colors.indigo,
        onPressed: (){
          setServantState();
        },
        child: Text('Adicionar Servo'),
      );
    }
  }


  @override
  void initState(){
    super.initState();
    watchGroupName.addListener(textListener);
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

                FlatButton(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  color: Colors.indigo,
                  onPressed: (){

                  },
                  child: Text('Concluir'),

                ),
              ],
            )
          ],
        ),
      )
    );
  }
}