import 'package:ccms/backend/services/user_group_management.dart';
import 'package:ccms/backend/services/user_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class StreamBuilderGroup extends StatefulWidget {
  @override
  _StreamBuilderGroupState createState() => _StreamBuilderGroupState();
}

class _StreamBuilderGroupState extends State<StreamBuilderGroup> {

  @override
  Widget build(BuildContext context) {
    final userGroupService = Provider.of<UserGroupManagement>(context);
    final leaderStream = Provider.of<UserManagement>(context).snapshotLeaders();
    return StreamBuilder(
        stream: userGroupService.snapshotGroups(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Carregando grupos...');
            default:
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot groupSnapshot =
                      snapshot.data.documents[index];
                  return InkWell(
                    onTap: (){},
                    child: Card(
                      margin: EdgeInsets.all(8),
                      elevation: 2.0,
                      child: ListTile(
                          title: Text('${groupSnapshot.data['group_name']}'),
                          subtitle: StreamBuilder(
                            stream: leaderStream,
                            builder: (BuildContext context, AsyncSnapshot snapshot){
                              return Text("Líder: ${snapshot.data.document(groupSnapshot.data['group_leader'])}");
                            },
                          ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: (){UserGroupManagement().deleteGroupFromSnapshot(groupSnapshot);},
                        ),

                      ),
                    ),
                  );
                },
              );
          }
        });
  }

  Future<String> returnName(groupSnapshot) async {
    String leaderName = '';
    await UserManagement()
        .userCollection
        .document(groupSnapshot.data['group_leader'])
        .get()
        .then((leader) => leaderName = "Líder: ${leader.data['name']}");
    return leaderName;
  }
}
