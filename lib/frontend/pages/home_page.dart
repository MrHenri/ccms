import 'package:ccms/backend/dao/Login_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Perfil"),
              leading: Builder(
                builder: (BuildContext context){
                  return IconButton(
                    icon: Icon(IconData(59475, fontFamily: 'MaterialIcons'),),
                    onPressed: () {_scaffoldKey.currentState.openDrawer();},
                  );
                },
              ),

            ),
            ListTile(
              title: Text("Escala"),
              leading: Builder(
                builder: (BuildContext context){
                  return IconButton(
                    icon: Icon(IconData(59555, fontFamily: 'MaterialIcons'),),
                    onPressed: () => Navigator.of(context).pushNamed('/escala'),
                  );
                },
              ),

            ),
            ListTile(
              title: Text("Edição de grupo"),
              leading: Builder(
                builder: (BuildContext context){
                  return IconButton(
                    icon: Icon(IconData(59376, fontFamily: 'MaterialIcons'),),
                    onPressed: () {_scaffoldKey.currentState.openDrawer();},
                  );
                },
              ),

            ),
            ListTile(
              title: Text("Protocolo"),
              leading: Builder(
                builder: (BuildContext context){
                  return IconButton(
                    icon: Icon(IconData(60219, fontFamily: 'MaterialIcons'),),
                    onPressed: () {_scaffoldKey.currentState.openDrawer();},
                  );
                },
              ),

            ),
            ListTile(
              title: Text("Treinamentos"),
              leading: Builder(
                builder: (BuildContext context){
                  return IconButton(
                    icon: Icon(IconData(57444, fontFamily: 'MaterialIcons'),),
                    onPressed: () {_scaffoldKey.currentState.openDrawer();},
                  );
                },
              ),

            ),
            ListTile(
              title: Text("Relatório"),
              leading: Builder(
                builder: (BuildContext context){
                  return IconButton(
                    icon: Icon(IconData(59485, fontFamily: 'MaterialIcons', matchTextDirection: true),),
                    onPressed: () {_scaffoldKey.currentState.openDrawer();},
                  );
                },
              ),

            ),
            ListTile(
              title: Text("Serviços"),
              leading: Builder(
                builder: (BuildContext context){
                  return IconButton(
                    icon: Icon(IconData(58905, fontFamily: 'MaterialIcons'),),
                    onPressed: () {_scaffoldKey.currentState.openDrawer();},
                  );
                },
              ),

            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          new Center(
            child: new Column(
              children: <Widget>[],
            ),
          ),
          Positioned(
            left: 10,
            top: 20,
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance
              .signOut()
              .then((value) {
                Login().signOut();
                Navigator.pushReplacementNamed(context, '/login');
              })
              .catchError((e){print(e);});
        },
        child: Text("Back"),
      ),
    );
  }
}