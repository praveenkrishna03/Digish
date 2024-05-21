import 'package:digish/pages/account/order_tile.dart';
import 'package:flutter/material.dart';

class My_orders extends StatefulWidget {
  @override
  My_orders_state createState() => My_orders_state();
}

class My_orders_state extends State<My_orders> {
  List<double> values = [0.25, 1.0, 0.50, 0.50, 0.75];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 163, 230, 165),
        title: Text("My Orders"),
      ),
      body: ListView.separated(
        itemCount: 5, // Replace 5 with the actual number of orders
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          // Replace the dummy values with actual data for each order
          return SizedBox(
              height: 55,
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  OrderTile(
                    progvalue: values[index], // Example progress value
                    name: "Order ${index + 1}",
                    seller: "Seller ${index + 1}",
                    id: "ID ${index + 1}",
                  )
                ],
              ));
        },
      ),
    );
  }
}
