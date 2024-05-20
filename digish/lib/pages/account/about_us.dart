import 'package:flutter/material.dart';

class About_us extends StatefulWidget {
  @override
  About_us_state createState() => About_us_state();
}

class About_us_state extends State<About_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 163, 230, 165),
        title: Text("About us"),
      ),
      body: Center(
        child: Text("About us"),
      ),
    );
  }
}
