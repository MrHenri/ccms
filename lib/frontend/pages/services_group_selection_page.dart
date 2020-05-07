import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceGroupSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ServiceGroupSelectionState();
}

class _ServiceGroupSelectionState extends State<ServiceGroupSelection>{
  //here we need a list of groups saved on data base
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Serviços"),),
      body: Column(),
    );
  }
}
