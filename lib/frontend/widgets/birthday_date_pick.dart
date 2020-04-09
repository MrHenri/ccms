import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class BirthdayDatePick extends StatefulWidget {
  @override
  _BirthdayDatePickState createState() => _BirthdayDatePickState();
}

class _BirthdayDatePickState extends State<BirthdayDatePick> {
  DateTime _date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 24),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(60)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 3,
              )
            ]
        ),    
        child: FlatButton(
          onPressed: () => configDatePick(),
          child: Row(
            children: <Widget>[
              Icon(Icons.calendar_today, color: Colors.grey),
              SizedBox(width: 16,),
              Text(
                returnData(_date),
                style: TextStyle(
                  color: returnDataColor(_date),
                ),
              ),
            ],
          ),
        ),   
      ),
    );
  }
  String returnData(DateTime date){
    if(date == null){
      return "Data de Nascimento";
    } else{
      return formatDate(date, [dd, '/', mm, '/', yyyy]).toString();
    }
  }

  Color returnDataColor(DateTime date) {
    if(date == null){
      return Colors.grey;
    } else{
      return Colors.black;
    }
  }

  void configDatePick() async{
    final datePick = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(1930), 
      lastDate: new DateTime.now(),
    ); 

    if (datePick != null && datePick != _date){
      setState(() {
        _date = datePick;
      });
    }
  }
}
