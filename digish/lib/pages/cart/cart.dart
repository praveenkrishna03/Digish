import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  Cart_state createState() => Cart_state();
}

class Cart_state extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 163, 230, 165),
        title: Center(child: Text("Cart")),
      ),
      body: Center(child: Text("Cart")),
    );
  }
}
