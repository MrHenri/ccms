import 'package:ccms/pages/home_page.dart';
import 'package:ccms/pages/loading_page.dart';
import 'package:ccms/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => LoadingPage(),
    '/login': (context) => LoginPage(),
    '/home': (context) => HomePage(),
  },
));
