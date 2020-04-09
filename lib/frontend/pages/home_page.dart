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
        onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
        child: Text("Back"),
      ),
    );
  }
}