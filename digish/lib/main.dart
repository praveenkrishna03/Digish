import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:digish/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:digish/constants.dart';
import 'package:digish/auth/auth.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: Constants.apiKey,
    appId: Constants.appId,
    messagingSenderId: Constants.messagingSenderId,
    projectId: Constants.projectId,
  ));
  runApp(const Digish());
}

class Digish extends StatelessWidget {
  const Digish({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: WidgetTree(),
      routes: {},
    );
  }
}
