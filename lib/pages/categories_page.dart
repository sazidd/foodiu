import 'package:flutter/material.dart';
import 'package:foodiu/models/food_categories_model.dart';
import 'package:foodiu/pages/detail_page.dart';
import 'package:foodiu/pages/home_page.dart';
import 'package:foodiu/widgets/food_item.dart';

class CategoriesPage extends StatelessWidget {
  final List<FoodCategoriesModel?> foodCategoriesModel;

  const CategoriesPage({required this.foodCategoriesModel});

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
        title: const Text('Categories'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.only(bottom: 32),
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: foodCategoriesModel.map((food) {
          return FoodItem(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    image: food!.image,
                    name: food.name,
                    price: food.price,
                  ),
                ),
              );
            },
            image: food!.image,
            name: food.name,
            price: food.price,
          );
        }).toList(),
      ),
    );
  }
}
