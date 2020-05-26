import 'package:ccms/backend/models/user_group.dart';
import 'package:ccms/frontend/flushbar_widget.dart';
import 'package:flutter/material.dart';

class RegisterGroupButton extends StatefulWidget {
  final UserGroup currentUserGroup;
  final String groupName;

  const RegisterGroupButton({Key key, this.currentUserGroup, this.groupName})
      : super(key: key);

  @override
  _RegisterGroupButtonState createState() => _RegisterGroupButtonState();
}

class _RegisterGroupButtonState extends State<RegisterGroupButton> {
  @override
  Widget build(BuildContext context) {
    Function function = isLeaderSelected();

    return FlatButton(
      onPressed: function,
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

  Function isLeaderSelected() {
    if (widget.currentUserGroup.getLeader().getName() != null) {
      return creationGroup;
    }
    return null;
  }

  creationGroup() {
    if (widget.groupName.length > 18) {
      PersonalFlushBar().showFlushBar(
          title: "Atenção:",
          message: "O nome do grupo deve possuir no máximo 18 caracteres.",
          context: context);
    } else {
      widget.currentUserGroup.setGroupName(widget.groupName);
      //UserGroupManagement().storeNewUserGroup(this.currentUserGroup);
      //Uncomment line above to REAL STORAGE OF THE GROUP DATA ON FIREBASE.
      PersonalFlushBar().showFlushBar(
          title: "Processo concluído.",
          message: "O grupo foi criado com sucesso.",
          context: context);
      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, '/groupCreationPage');
        //this line need to be modified to route the page to the group list page (not implemented yet)
      });
    }
  }
}
