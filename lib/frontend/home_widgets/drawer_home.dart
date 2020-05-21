import 'package:flutter/material.dart';

class DrawerHome extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerHome({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Perfil"),
              leading: Builder(
                builder: (BuildContext context){
                  return IconButton(
                    icon: Icon(IconData(59475, fontFamily: 'MaterialIcons'),),
                    onPressed: () {widget.scaffoldKey.currentState.openDrawer();},
                  );
                },
              ),

            ),

            FlatButton(
              onPressed: () => Navigator.of(context).pushNamed('/escala'),
              child: ListTile(
                title: Text("Escala"),
                leading: Builder(
                  builder: (BuildContext context){
                    return Icon(IconData(59555, fontFamily: 'MaterialIcons'),);
                  },
                ),
              ),
            ),

            FlatButton(
              onPressed: () {widget.scaffoldKey.currentState.openDrawer();},
              child: ListTile(
                title: Text("Edição de grupo"),
                leading: Builder(
                  builder: (BuildContext context){
                    return Icon(IconData(59376, fontFamily: 'MaterialIcons'),);
                  },
                ),

              ),
            ),

            FlatButton(
              onPressed: () {widget.scaffoldKey.currentState.openDrawer();},
              child: ListTile(
                title: Text("Protocolo"),
                leading: Builder(
                  builder: (BuildContext context){
                    return Icon(IconData(60219, fontFamily: 'MaterialIcons'),);
                  },
                ),

              ),
            ),

            FlatButton(
              onPressed: () {widget.scaffoldKey.currentState.openDrawer();},
              child: ListTile(
                title: Text("Treinamentos"),
                leading: Builder(
                  builder: (BuildContext context){
                    return Icon(IconData(57444, fontFamily: 'MaterialIcons'),);
                  },
                ),

              ),
            ),

            FlatButton(
              onPressed: () {widget.scaffoldKey.currentState.openDrawer();},
              child: ListTile(
                title: Text("Relatório"),
                leading: Builder(
                  builder: (BuildContext context){
                    return Icon(IconData(59485, fontFamily: 'MaterialIcons', matchTextDirection: true),);
                  },
                ),

              ),
            ),

            FlatButton(
              onPressed: () {widget.scaffoldKey.currentState.openDrawer();},
              child: ListTile(
                title: Text("Serviços"),
                leading: Builder(
                  builder: (BuildContext context){
                    return Icon(IconData(58905, fontFamily: 'MaterialIcons'),);
                  },
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
