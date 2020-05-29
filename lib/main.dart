import 'package:ccms/frontend/pages/escala_page.dart';
import 'package:ccms/frontend/pages/group_creation_page.dart';
import 'package:ccms/frontend/pages/group_page.dart';
import 'package:ccms/frontend/pages/home_page.dart';
import 'package:ccms/frontend/pages/loading_page.dart';
import 'package:ccms/frontend/pages/login_page.dart';
import 'package:ccms/frontend/pages/signup_page.dart';
import 'package:ccms/frontend/pages/training_page.dart';
import 'package:flutter/material.dart';

import 'frontend/pages/group_editor_page.dart';
import 'frontend/pages/services_page.dart';

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
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
        '/services': (context) => Services(),
        '/groupPage': (context) => GroupPage(),
        '/groupCreationPage': (context) => GroupCreationPage(),
        '/groupEditorPage': (context) => GroupEditorPage(),
        '/trainingPage': (context) => TrainingPage(),
        '/escalaPage': (context) => EscalaPage(),
      },
    );
  }
}
