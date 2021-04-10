import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  final VoidCallback onTap;
  final String? image;
  final String? name;
  final String? price;

  const FoodItem({
    required this.onTap,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
        width: 200,
        height: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.network(
              image ?? 'https://avatars.githubusercontent.com/u/53822204?v=4',
            ),
            ListTile(
              leading: Text(
                name!.length > 10 ? name!.substring(0, 9) + '...' : name!,
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text('\$$price', style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.amber),
                  Icon(Icons.star, size: 16, color: Colors.amber),
                  Icon(Icons.star, size: 16, color: Colors.amber),
                  Icon(Icons.star, size: 16, color: Colors.amber),
                  Icon(Icons.star, size: 16, color: Colors.amber),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
