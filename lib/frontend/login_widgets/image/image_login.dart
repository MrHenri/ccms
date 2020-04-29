import 'package:flutter/material.dart';

class ImageLogin extends StatefulWidget {
  const ImageLogin({Key key}) : super(key: key);

  @override
  _ImageLoginState createState() => _ImageLoginState();
}

class _ImageLoginState extends State<ImageLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/2.2,
      ),           
      child: Image.asset(
        "assets/login.jpeg",
        fit: BoxFit.fill,
      ),
    );
  }
}