import 'package:flutter/material.dart';

class RegisterPadding extends StatefulWidget {
  final StatefulWidget field;

  const RegisterPadding({
    Key key,
    this.field,
  }) : super(key: key);

  @override
  _RegisterPaddingState createState() => _RegisterPaddingState();
}

class _RegisterPaddingState extends State<RegisterPadding> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30, left: 30),
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
          ]),
      child: Padding(padding: EdgeInsets.all(5), child: widget.field),
    );
  }
}
