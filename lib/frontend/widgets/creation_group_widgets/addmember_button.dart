import 'package:ccms/backend/models/user_group.dart';
import 'package:flutter/material.dart';

class AddMemberButton extends StatefulWidget {

  final Function showSelectLeaders;
  final Function showSelectServant;
  final UserGroup currentUserGroup;

  const AddMemberButton({Key key, this.showSelectLeaders, this.showSelectServant, this.currentUserGroup,}) : super(key: key);

  @override
  _AddMemberButtonState createState() => _AddMemberButtonState();
}

class _AddMemberButtonState extends State<AddMemberButton> {

  String text = "Adicionar Líder";
  Icon icon = Icon(Icons.person_add);

  @override
  Widget build(BuildContext context) {
    Function function = thereIsLeader();
    return FlatButton(
      onPressed: function,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
              )),
          icon
        ],
      ),
    );
  }

  thereIsLeader() {
    if (widget.currentUserGroup.getLeader().getName() != null){
      text = "Adicionar Servo";
      icon = Icon(Icons.group_add);
      return widget.showSelectServant;
    }
    text = "Adicionar Líder";
    icon = Icon(Icons.person_add);
    return widget.showSelectLeaders;
  }
}
