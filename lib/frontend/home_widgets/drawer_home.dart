import 'package:ccms/backend/dao/Login_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DrawerHome extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerHome({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FlatButton(
              splashColor: Colors.transparent,
              padding: EdgeInsets.all(8),
              onPressed: () {},
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 35,
                ),
                radius: 35,
              ),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pushNamed('/escala'),
              child: ListTile(
                title: Text("Escala"),
                leading: Builder(
                  builder: (BuildContext context) {
                    return Icon(
                      IconData(59555, fontFamily: 'MaterialIcons'),
                    );
                  },
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/groupPage');
              },
              child: ListTile(
                title: Text("Edição de grupo"),
                leading: Builder(
                  builder: (BuildContext context) {
                    return Icon(
                      IconData(59376, fontFamily: 'MaterialIcons'),
                    );
                  },
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                widget.scaffoldKey.currentState.openDrawer();
              },
              child: ListTile(
                title: Text("Protocolo"),
                leading: Builder(
                  builder: (BuildContext context) {
                    return Icon(
                      IconData(60219, fontFamily: 'MaterialIcons'),
                    );
                  },
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/trainingPage');
              },
              child: ListTile(
                title: Text("Treinamentos"),
                leading: Builder(
                  builder: (BuildContext context) {
                    return Icon(
                      IconData(57444, fontFamily: 'MaterialIcons'),
                    );
                  },
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                widget.scaffoldKey.currentState.openDrawer();
              },
              child: ListTile(
                title: Text("Relatório"),
                leading: Builder(
                  builder: (BuildContext context) {
                    return Icon(
                      IconData(59485,
                          fontFamily: 'MaterialIcons',
                          matchTextDirection: true),
                    );
                  },
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                widget.scaffoldKey.currentState.openDrawer();
              },
              child: ListTile(
                title: Text("Serviços"),
                leading: Builder(
                  builder: (BuildContext context) {
                    return Icon(
                      IconData(58905, fontFamily: 'MaterialIcons'),
                    );
                  },
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                logOut();
              },
              child: ListTile(
                title: Text("LogOut"),
                leading: Builder(
                  builder: (BuildContext context) {
                    return Icon(Icons.subdirectory_arrow_left);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logOut() {
    FirebaseAuth.instance.signOut().then((value) {
      Login().signOut();
      Navigator.pushReplacementNamed(context, '/login');
    }).catchError((e) {
      print(e);
    });
  }
}
