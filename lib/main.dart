import 'package:ccms/frontend/pages/escala_page.dart';
import 'package:ccms/frontend/pages/home_page.dart';
import 'package:ccms/frontend/pages/loading_page.dart';
import 'package:ccms/frontend/pages/login_page.dart';
import 'package:ccms/frontend/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(SmtApp());

class SmtApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
//        '/': (context) => LoadingPage(),
//        '/escala': (context) => EscalaPage(),
        '/': (context) => EscalaPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
