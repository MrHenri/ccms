import 'package:flutter/material.dart';

class ButtonCustomizedContainer extends StatefulWidget {
  final String text;
  ButtonCustomizedContainer({Key key, this.text}) : super(key: key);

  @override
  _ButtonCustomizedContainerState createState() => _ButtonCustomizedContainerState();
}

class _ButtonCustomizedContainerState extends State<ButtonCustomizedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 40),
      width: MediaQuery.of(context).size.width/1.8,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF0081f9),
          Color(0xFF000000),
        ]),
        borderRadius: BorderRadius.circular(90),
      ),
      child: FlatButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90)
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
