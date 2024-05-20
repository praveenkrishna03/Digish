import 'package:flutter/material.dart';

class Payment_opt extends StatefulWidget {
  @override
  Payment_opt_state createState() => Payment_opt_state();
}

class Payment_opt_state extends State<Payment_opt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 163, 230, 165),
        title: Text("payment_opt"),
      ),
      body: Center(
        child: Text("payment_opt"),
      ),
    );
  }
}
