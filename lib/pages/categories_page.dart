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
      body: Padding(
        padding: const EdgeInsets.all(8).copyWith(bottom: 0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 600) {
              return GridView.count(
                padding: const EdgeInsets.only(bottom: 32),
                crossAxisCount: 6,
                childAspectRatio: 0.75,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: foodCategoriesModel.map((food) {
                  return FoodItem(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            image: food!.image,
                            name: food.name!,
                            price: food.price!,
                          ),
                        ),
                      );
                    },
                    image: food!.image,
                    name: food.name!,
                    price: food.price!,
                  );
                }).toList(),
              );
            }
            return GridView.count(
              padding: const EdgeInsets.only(bottom: 32),
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: foodCategoriesModel.map((food) {
                return FoodItem(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          image: food!.image,
                          name: food.name!,
                          price: food.price!,
                        ),
                      ),
                    );
                  },
                  image: food!.image,
                  name: food.name!,
                  price: food.price!,
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
