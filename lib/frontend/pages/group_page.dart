import 'package:ccms/backend/services/user_group_management.dart';
import 'package:ccms/backend/services/user_management.dart';
import 'package:ccms/frontend/widgets/creation_group_widgets/stream_builder_group.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {

  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UserManagement>(context);

    return Provider<UserManagement>.value(
      value: userService,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Equipes Disponíveis",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.blue,
          elevation: 16,
          leading: Container(
            margin: EdgeInsets.all(6),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.group,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.grey[150],

        body: StreamBuilderGroup(),

        floatingActionButton: FloatingActionButton(
          onPressed: (){},
        ),
      ),
    );
  }
}
