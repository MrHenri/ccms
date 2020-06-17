import 'package:ccms/backend/controllers/setting_members.dart';
import 'package:ccms/backend/models/user_group.dart';
import 'package:ccms/backend/services/user_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamBuilderLeader extends StatefulWidget {
  final UserGroup currentUserGroup;
  final ValueChanged<UserGroup> userGroupRefresh;

  const StreamBuilderLeader(
      {Key key, this.currentUserGroup, this.userGroupRefresh})
      : super(key: key);

  @override
  _StreamBuilderLeaderState createState() => _StreamBuilderLeaderState();
}

class _StreamBuilderLeaderState extends State<StreamBuilderLeader> {
  final snapshotLeaders = UserManagement().snapshotLeaders();

  @override
  Widget build(BuildContext context) {
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
                            settingMembers(
                                widget.currentUserGroup, leaderSnapshot);
                            widget.userGroupRefresh(widget.currentUserGroup);
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

  void settingMembers(UserGroup userGroup, DocumentSnapshot leaderSnapshot) =>
      SettingMembers(currentUserGroup: userGroup).settingLeader(leaderSnapshot);
}
