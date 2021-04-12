import 'package:flutter/material.dart';
import 'package:foodiu/pages/home_page.dart';
import 'package:foodiu/pages/order_page.dart';
import 'package:foodiu/providers/my_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);
    var total = myProvider.totalPrice();

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
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: myProvider.carts.length,
        itemBuilder: (context, index) {
          final cart = myProvider.carts[index]!;
          myProvider.getDeleteIndex(index);
          return buildContent(
            context,
            onPressed: () => myProvider.delete(),
            image: cart.image,
            name: cart.name!,
            price: cart.price,
            quantity: cart.quantity,
          );
        },
      ),
      bottomNavigationBar: buildBottomButton(context, total),
    );
  }

  Widget buildContent(
    BuildContext context, {
    required VoidCallback onPressed,
    required String? image,
    required String name,
    required String? price,
    required String quantity,
  }) {
    return Row(
      children: [
        Expanded(
          child: buildImage(image),
        ),
        Expanded(
          child: buildDescription(
            name,
            price,
            context,
            quantity,
            onPressed,
          ),
        ),
      ],
    );
  }

  Widget buildImage(String? image) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 200,
      child: Image.network(
        image ?? 'https://avatars.githubusercontent.com/u/53822204?v=4',
      ),
    );
  }

  Widget buildDescription(
    String name,
    String? price,
    BuildContext context,
    String quantity,
    VoidCallback onPressed,
  ) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: 28)),
              const SizedBox(height: 8),
              Text('Lorem ipsum dolor sit amet'),
              const SizedBox(height: 8),
              Text(
                '\$$price',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  Text(
                    quantity,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 16,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }

  Widget buildBottomButton(BuildContext context, double total) {
    return Container(
      margin: const EdgeInsets.all(16).copyWith(top: 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$$total',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 60),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderPage(total: total),
                ),
              );
            },
            child: Text(
              'Check Out',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
