import 'package:ccms/backend/Login_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home", style: TextStyle(color: Colors.blueGrey),),
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