import 'package:flutter/material.dart';

class EscalaNameContainer extends StatefulWidget {

  final ValueChanged<String> escalaNameRefresh;

  const EscalaNameContainer({Key key, this.escalaNameRefresh}) : super(key: key);

  @override
  _EscalaNameContainerState createState() => _EscalaNameContainerState(this.escalaNameRefresh);
}

class _EscalaNameContainerState extends State<EscalaNameContainer> {

  ValueChanged<String> escalaNameRefresh;
  _EscalaNameContainerState(this.escalaNameRefresh);

  final nameEscalaController = TextEditingController();

  @override
  void dispose() {
    nameEscalaController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    nameEscalaController.addListener(_setEscalaName);
    super.initState();
  }

  _setEscalaName(){
    escalaNameRefresh(nameEscalaController.text);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 16, 8, 0),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            )
          ]),
      child: TextFormField(
        controller: nameEscalaController,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Prédio",
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}