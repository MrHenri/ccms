import 'package:ccms/backend/models/user.dart';
import 'package:ccms/backend/models/user_group.dart';
import 'package:flutter/material.dart';

class GroupListView extends StatefulWidget {
  final UserGroup currentUserGroup;
  final ValueChanged<UserGroup> userGroupRefresh;

  const GroupListView({Key key, this.currentUserGroup, this.userGroupRefresh}) : super(key: key);

  @override
  GroupListViewState createState() => GroupListViewState();
}

class GroupListViewState extends State<GroupListView> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getMembers(),
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
                            widget.currentUserGroup
                                .removeMember(snapshot.data[index]);
                            widget.userGroupRefresh(widget.currentUserGroup);
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

  Future<List<User>> _getMembers() async {
    List<User> members = [];
    ///Return a list of recent added members.
    if (widget.currentUserGroup.getLeader().getName() != null) {
      members = [widget.currentUserGroup.getLeader()] +
          widget.currentUserGroup.getServants();
    } else {
      members = widget.currentUserGroup.getServants();
    }
    return members;
  }
}
