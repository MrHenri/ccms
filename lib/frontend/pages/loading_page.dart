import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
<<<<<<< Updated upstream
    Future.delayed(const Duration(seconds: 2),(){
      initiateApp();
    });
  }

  void initiateApp(){
    Navigator.pushReplacementNamed(context, '/login');
=======
    initiateApp();
>>>>>>> Stashed changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 200.0,
        ),
      ),
    );
  }

  void initiateApp() async {
    await FirebaseAuth.instance.currentUser().then((firebaseUser) {
      if (firebaseUser != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/home', (Route<dynamic> route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', (Route<dynamic> route) => false);
      }
    });
  }
}



