import 'package:flutter/material.dart';

class IsHaveAccountText extends StatefulWidget {
  final String question;
  final String awnser;
  IsHaveAccountText({Key key, this.question, this.awnser}) : super(key: key);

  @override
  _IsHaveAccountTextState createState() => _IsHaveAccountTextState();
}

class _IsHaveAccountTextState extends State<IsHaveAccountText> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      child: FlatButton(
        splashColor: Colors.transparent,  
        highlightColor: Colors.transparent,
        textTheme: ButtonTextTheme.accent,
        onPressed: (){
          Navigator.of(context).pushNamed('/signup');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.question,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              widget.awnser,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}