
import 'package:flutter/material.dart';

class PersonalAlertDialog{

 AlertDialog showCofirmationDialog({BuildContext context, String message, Future<void> confirmationFunction}){
   ///Receives a context, a message and a function to run after press confirm button.

   Widget _cancelButton = FlatButton(
     child: Text('Cancelar'),
     onPressed:  () {
       Navigator.of(context).pop();
     },
   );

   Widget _confirmationButton = FlatButton(
     child: Text('Confirmar'),
     onPressed:  () {
       confirmationFunction;
       Navigator.of(context).pop();
     },
   );

   AlertDialog alert = AlertDialog(
     title: Text('Atenção:'),
     content: Text(message),
     actions: [
       _cancelButton,
       _confirmationButton,
     ],
   );

   showDialog(
     context: context, builder: (BuildContext context){
       return alert;
    }
   );
 }
}