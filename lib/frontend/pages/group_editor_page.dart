import 'package:ccms/backend/services/user_group_management.dart';
import 'package:ccms/frontend/show_dialog_confirmation_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupEditorPage extends StatefulWidget {
  @override
  _GroupEditorState createState() => _GroupEditorState();

}

class _GroupEditorState extends State<GroupEditorPage>{

  final snapshotGroups = UserGroupManagement().snapshotGroups();

  @override
  void initState(){
    super.initState();
  }

  Widget _buildGroups(){
    return StreamBuilder(
      stream: snapshotGroups,
      builder: (BuildContext context, AsyncSnapshot snapshot)
      {
        if (snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        } switch (snapshot.connectionState){
          case ConnectionState.waiting: return Text('Carregando líderes...');
          default:
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                  color: Colors.grey
              ),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                DocumentSnapshot _groupSnapshot = snapshot.data.documents[index];

                return ListTile(
                  title: Text('Grupo: ' + '${_groupSnapshot.data['group_name']}'),
                  subtitle: Text('Número de membros: ' + '${(_groupSnapshot.data['group_servants'].length + 1).toString()}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      editGroupButton(_groupSnapshot),
                      deleteGroupButton(_groupSnapshot),
                    ],
                  ),
                );
              },
            );
        }
      }
    );
  }

  Widget editGroupButton(DocumentSnapshot _groupSnapshot){
    return IconButton(
      icon: Icon(Icons.edit),
      color: Colors.indigo,
      onPressed: (){
        setState(() {

        });
      },
    );
  }

  Widget deleteGroupButton(DocumentSnapshot _groupSnapshot){
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.indigo,
      onPressed: (){
        setState(() {

          PersonalAlertDialog().showCofirmationDialog(
              context: context,
              message: 'Deseja realmente deletar o grupo?',
              confirmationFunction: UserGroupManagement().deleteGroupFromSnapshot(_groupSnapshot),
          );
        });
      },
    );
  }

  void groupEditor(){
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder:(BuildContext context){
          return Scaffold(
            appBar: AppBar(title: Text('Editar Grupo'), backgroundColor: Colors.indigo),
            body: SingleChildScrollView(
              child: Column(),
            ),
          );
        }
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grupos'), backgroundColor: Colors.indigo,),
      body: _buildGroups(),
      );
  }
}