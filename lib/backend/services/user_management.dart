import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class UserManagement{
  storeNewUser(user, context){
    Firestore.instance
        .collection('/users')
        .add({
      'email': user.email,
      'id': user.id,
    })
        .then((value){
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/home');
    })
        .catchError((e){
      print(e);
    });
  }
}