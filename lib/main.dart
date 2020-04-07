import 'package:ccms/pages/home_page.dart';
import 'package:ccms/pages/loading_page.dart';
import 'package:ccms/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(SmtApp());

class SmtApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
