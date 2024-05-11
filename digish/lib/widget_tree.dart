import 'package:digish/auth/auth.dart';
import 'package:digish/main.dart';
import 'package:digish/pages/login.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WidgetTree();
        } else {
          return Login();
        }
      },
    );
  }
}
