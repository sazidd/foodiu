import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodiu/models/categories_model.dart';
import 'package:foodiu/models/food_categories_model.dart';
import 'package:foodiu/models/food_model.dart';
import 'package:foodiu/pages/cart_page.dart';
import 'package:foodiu/pages/categories_page.dart';
import 'package:foodiu/pages/detail_page.dart';
import 'package:foodiu/pages/login_page.dart';
import 'package:foodiu/pages/profile_page.dart';
import 'package:foodiu/providers/my_provider.dart';
import 'package:foodiu/widgets/food_item.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel?> burgers = [];
  List<CategoryModel?> pizzas = [];
  List<CategoryModel?> steaks = [];
  List<CategoryModel?> salads = [];
  List<CategoryModel?> biryanis = [];
  List<CategoryModel?> drinks = [];
  List<FoodModel?> foods = [];
  List<FoodCategoriesModel?> burgerCategories = [];
  List<FoodCategoriesModel?> pizzaCategories = [];
  List<FoodCategoriesModel?> steakCategories = [];
  List<FoodCategoriesModel?> saladCategories = [];
  List<FoodCategoriesModel?> biryaniCategories = [];
  List<FoodCategoriesModel?> drinkCategories = [];

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Demo'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/52134364?v=4',
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: buildDrawer(),
      body: buildContent(context),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/52134364?v=4',
              ),
            ),
            accountName: Text('Rehman Sazid'),
            accountEmail: Text('rehmansazid@email.com'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Order'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Communicate'),
          ),
          // ListTile(
          //   leading: const Icon(Icons.lock),
          //   title: const Text('Change'),
          //   onTap: () {},
          // ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: () {
              logOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);

    myProvider.fetchBurgers();
    burgers = myProvider.burgers;

    myProvider.fetchPizzas();
    pizzas = myProvider.pizzas;

    myProvider.fetchSteaks();
    steaks = myProvider.steaks;

    myProvider.fetchSalads();
    salads = myProvider.salads;

    myProvider.fetchBiryanis();
    biryanis = myProvider.biryanis;

    myProvider.fetchDrinks();
    drinks = myProvider.drinks;

    myProvider.fetchFoods();
    foods = myProvider.foods;

    myProvider.fetchBurgersList();
    burgerCategories = myProvider.burgerCategories;

    myProvider.fetchPizzasList();
    pizzaCategories = myProvider.pizzaCategories;

    myProvider.fetchSteaksList();
    steakCategories = myProvider.steakCategories;

    myProvider.fetchSaladsList();
    saladCategories = myProvider.saladCategories;

    myProvider.fetchBiryanisList();
    biryaniCategories = myProvider.biryaniCategories;

    myProvider.fetchDrinksList();
    drinkCategories = myProvider.drinkCategories;

    return Padding(
      padding: const EdgeInsets.all(8).copyWith(bottom: 0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.black,
                          prefix: const Icon(Icons.search),
                          hintText: 'Search food...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            burger(),
                            pizza(),
                            steak(),
                            salad(),
                            biryani(),
                            drink(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 200,
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(bottom: 32),
                            itemCount: foods.length,
                            itemBuilder: (context, index) {
                              final food = foods[index]!;
                              return FoodItem(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        image: food.image,
                                        name: food.name,
                                        price: food.price,
                                      ),
                                    ),
                                  );
                                },
                                image: food.image,
                                name: food.name,
                                price: food.price,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  prefix: const Icon(Icons.search),
                  hintText: 'Search food...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    burger(),
                    pizza(),
                    steak(),
                    salad(),
                    biryani(),
                    drink(),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.only(bottom: 32),
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: foods.map((food) {
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
              ),
            ],
          );
        },
      ),
    );
  }

  Widget burger() {
    return Row(
      children: burgers.map((burger) {
        return buildCategories(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesPage(
                  foodCategoriesModel: burgerCategories,
                ),
              ),
            );
          },
          image: burger!.image,
          name: burger.name!,
        );
      }).toList(),
    );
  }

  Widget pizza() {
    return Row(
      children: pizzas.map((pizza) {
        return buildCategories(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesPage(
                  foodCategoriesModel: pizzaCategories,
                ),
              ),
            );
          },
          image: pizza!.image,
          name: pizza.name!,
        );
      }).toList(),
    );
  }

  Widget steak() {
    return Row(
      children: steaks.map((steak) {
        return buildCategories(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesPage(
                  foodCategoriesModel: steakCategories,
                ),
              ),
            );
          },
          image: steak!.image,
          name: steak.name!,
        );
      }).toList(),
    );
  }

  Widget salad() {
    return Row(
      children: salads.map((salad) {
        return buildCategories(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesPage(
                  foodCategoriesModel: saladCategories,
                ),
              ),
            );
          },
          image: salad!.image,
          name: salad.name!,
        );
      }).toList(),
    );
  }

  Widget biryani() {
    return Row(
      children: biryanis.map((biryani) {
        return buildCategories(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesPage(
                  foodCategoriesModel: biryaniCategories,
                ),
              ),
            );
          },
          image: biryani!.image,
          name: biryani.name!,
        );
      }).toList(),
    );
  }

  Widget drink() {
    return Row(
      children: drinks.map((drink) {
        return buildCategories(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesPage(
                  foodCategoriesModel: drinkCategories,
                ),
              ),
            );
          },
          image: drink!.image,
          name: drink.name!,
        );
      }).toList(),
    );
  }

  Widget buildCategories({
    required VoidCallback onTap,
    required String? image,
    required String name,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: image != null
                    ? NetworkImage(image)
                    : NetworkImage(
                        'https://avatars.githubusercontent.com/u/52134364?v=4',
                      ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(name),
      ],
    );
  }
}
