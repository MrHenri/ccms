import 'package:ccms/backend/dao/setting_members.dart';
import 'package:ccms/backend/models/user_group.dart';
import 'package:ccms/backend/services/user_management.dart';
import 'package:ccms/frontend/flushbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class StreamBuilderServant extends StatefulWidget {
  final UserGroup currentUserGroup;
  final ValueChanged<UserGroup> userGroupRefresh;

  const StreamBuilderServant(
      {Key key, this.currentUserGroup, this.userGroupRefresh})
      : super(key: key);

  @override
  _StreamBuilderServantState createState() => _StreamBuilderServantState();
}

class _StreamBuilderServantState extends State<StreamBuilderServant> {
  final snapshotServants = UserManagement().snapshotServants();

  @override
  Widget build(BuildContext context) {
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
                            if (widget.currentUserGroup
                                .searchServant(servantSnapshot.data['email'])) {
                              PersonalFlushBar().showFlushBar(
                                  title: "Atenção",
                                  message: "Este servo já foi adicionado",
                                  context: context);
                            } else {
                              SettingMembers(
                                      currentUserGroup: widget.currentUserGroup)
                                  .settingServant(servantSnapshot);
                              widget.userGroupRefresh(widget.currentUserGroup);
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
}
