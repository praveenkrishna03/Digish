import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:digish/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:digish/constants.dart';
import 'package:digish/auth/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: Constants.apiKey,
    appId: Constants.appId,
    messagingSenderId: Constants.messagingSenderId,
    projectId: Constants.projectId,
  ));
  runApp(Digish());
}

class Digish extends StatelessWidget {
  Digish({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WidgetTree(),
      routes: {},
    );
  }
}
