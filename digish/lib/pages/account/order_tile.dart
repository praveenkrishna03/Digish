import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final double? progvalue;
  final String name;
  final String seller;
  final String id;

  IconData _getIconForProgress(double? progvalue) {
    if (progvalue == null) {
      return Icons.error;
    } else if (progvalue == 0.0) {
      return Icons.not_interested_rounded;
    } else if (progvalue == 0.25) {
      return Icons.price_check_sharp;
    } else if (progvalue == 0.5) {
      return Icons.precision_manufacturing_rounded;
    } else if (progvalue == 0.75) {
      return Icons.delivery_dining_rounded;
    } else if (progvalue == 1.0) {
      return Icons.check_circle_outline_rounded;
    } else {
      return Icons.error;
    }
  }

  OrderTile({
    this.progvalue,
    required this.name,
    required this.seller,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Order $name clicked");
      },
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CircularProgressIndicator(
                value: progvalue,
                strokeWidth: 4,
              ),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    seller,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 10), // Add 10 units of space after the icon
                    child: Icon(
                      _getIconForProgress(progvalue),
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
