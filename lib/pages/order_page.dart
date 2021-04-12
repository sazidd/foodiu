import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodiu/pages/home_page.dart';

class OrderPage extends StatelessWidget {
  final double? total;

  const OrderPage({required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        title: const Text('Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 600) {
              return Center(
                child: Text(
                  total != null
                      ? 'Your order has been completed successfully!'
                      : 'Order something!',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
            return Center(
              child: Text(
                total != null
                    ? 'Your order has been completed successfully!'
                    : 'Order something!',
                style: TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}
