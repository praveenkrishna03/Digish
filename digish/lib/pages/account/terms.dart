import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  @override
  Terms_state createState() => Terms_state();
}

class Terms_state extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 163, 230, 165),
        title: Text("Terms"),
      ),
      body: Center(
        child: Text("Terms"),
      ),
    );
  }
}
