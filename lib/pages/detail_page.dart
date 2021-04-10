import 'package:flutter/material.dart';
import 'package:foodiu/pages/cart_page.dart';
import 'package:foodiu/pages/home_page.dart';
import 'package:foodiu/providers/my_provider.dart';

import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final String? image;
  final String? name;
  final String? price;

  const DetailPage({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);

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
        title: const Text('Detail'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600) {
            return Row(
              children: [
                Expanded(child: buildImage()),
                Expanded(child: buildDescription(context, myProvider)),
              ],
            );
          }
          return Column(
            children: [
              buildImage(),
              buildDescription(context, myProvider),
            ],
          );
        },
      ),
    );
  }

  Widget buildImage() {
    return Container(
      child: Image.network(
        widget.image ?? 'https://avatars.githubusercontent.com/u/53822204v=4',
      ),
    );
  }

  Widget buildDescription(BuildContext context, MyProvider myProvider) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name!,
            style: TextStyle(fontSize: 20),
          ),
          Text('Lorem ipsum dolor sit amet'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      setState(() {
                        quantity--;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
              Text(
                '\$${widget.price}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Text(
            'Description',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              myProvider.addToCart(
                image: widget.image,
                name: widget.name,
                price: widget.price,
                quantity: quantity.toString(),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart),
                  const SizedBox(width: 16),
                  const Text('Add To Cart'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
