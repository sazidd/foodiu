import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:foodiu/models/cart_model.dart';
import 'package:foodiu/models/categories_model.dart';
import 'package:foodiu/models/food_categories_model.dart';
import 'package:foodiu/models/food_model.dart';

class MyProvider extends ChangeNotifier {
  /// users info
  Future<DocumentSnapshot> fetchUserInfo() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return documentSnapshot;
  }

  /// category [burger]
  CategoryModel? _burgerModel;
  List<CategoryModel?> _burgers = [];

  List<CategoryModel?> get burgers => _burgers;

  Future<void> fetchBurgers() async {
    var newBurgers = <CategoryModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('HKXPqknQTZ3JNBhaHgCf')
        .collection('burger')
        .get();

    querySnapshot.docs.forEach((burger) {
      _burgerModel = CategoryModel(
        image: burger.data()['image'],
        name: burger.data()['name'],
      );
      newBurgers.add(_burgerModel);
      _burgers = newBurgers;
    });
  }

  /// category [pizza]
  CategoryModel? _pizzaModel;
  List<CategoryModel?> _pizzas = [];

  List<CategoryModel?> get pizzas => _pizzas;

  Future<void> fetchPizzas() async {
    var newPizzas = <CategoryModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('HKXPqknQTZ3JNBhaHgCf')
        .collection('pizza')
        .get();

    querySnapshot.docs.forEach((pizza) {
      _pizzaModel = CategoryModel(
        image: pizza.data()['image'],
        name: pizza.data()['name'],
      );
      newPizzas.add(_pizzaModel);
      _pizzas = newPizzas;
    });
  }

  /// category [steak]
  CategoryModel? _steakModel;
  List<CategoryModel?> _steaks = [];

  List<CategoryModel?> get steaks => _steaks;

  Future<void> fetchSteaks() async {
    var newSteaks = <CategoryModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('HKXPqknQTZ3JNBhaHgCf')
        .collection('steak')
        .get();

    querySnapshot.docs.forEach((steak) {
      _steakModel = CategoryModel(
        image: steak.data()['image'],
        name: steak.data()['name'],
      );
      newSteaks.add(_steakModel);
      _steaks = newSteaks;
    });
  }

  /// category [salad]
  CategoryModel? _saladModel;
  List<CategoryModel?> _salads = [];

  List<CategoryModel?> get salads => _salads;

  Future<void> fetchSalads() async {
    var newSalads = <CategoryModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('HKXPqknQTZ3JNBhaHgCf')
        .collection('salad')
        .get();

    querySnapshot.docs.forEach((salad) {
      _saladModel = CategoryModel(
        image: salad.data()['image'],
        name: salad.data()['name'],
      );
      newSalads.add(_saladModel);
      _salads = newSalads;
    });
  }

  /// category [biryani]
  CategoryModel? _biryaniModel;
  List<CategoryModel?> _biryanis = [];

  List<CategoryModel?> get biryanis => _biryanis;

  Future<void> fetchBiryanis() async {
    var newBiryanis = <CategoryModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('HKXPqknQTZ3JNBhaHgCf')
        .collection('biryani')
        .get();

    querySnapshot.docs.forEach((biryani) {
      _biryaniModel = CategoryModel(
        image: biryani.data()['image'],
        name: biryani.data()['name'],
      );
      newBiryanis.add(_biryaniModel);
      _biryanis = newBiryanis;
    });
  }

  /// category [drink]
  CategoryModel? _drinkModel;
  List<CategoryModel?> _drinks = [];

  List<CategoryModel?> get drinks => _drinks;

  Future<void> fetchDrinks() async {
    var newDrinks = <CategoryModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('HKXPqknQTZ3JNBhaHgCf')
        .collection('drink')
        .get();

    querySnapshot.docs.forEach((drink) {
      _drinkModel = CategoryModel(
        image: drink.data()['image'],
        name: drink.data()['name'],
      );
      newDrinks.add(_drinkModel);
      _drinks = newDrinks;
    });
  }

  /// single food items [food]
  FoodModel? _foodModel;
  List<FoodModel?> _foods = [];

  List<FoodModel?> get foods => _foods;

  Future<void> fetchFoods() async {
    var newFoods = <FoodModel?>[];
    var querySnapshot =
        await FirebaseFirestore.instance.collection('foods').get();

    querySnapshot.docs.forEach((food) {
      _foodModel = FoodModel(
        image: food.data()['image'],
        name: food.data()['name'],
        price: food.data()['price'],
      );
      newFoods.add(_foodModel);
      _foods = newFoods;
    });
  }

  /// category list [burger]
  FoodCategoriesModel? _burgerCategoriesModel;
  List<FoodCategoriesModel?> _burgerCategories = [];

  List<FoodCategoriesModel?> get burgerCategories => _burgerCategories;

  Future<void> fetchBurgersList() async {
    var newBurgerCategories = <FoodCategoriesModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('food-categories')
        .doc('GtAM48SvhcK8JsfkxAkJ')
        .collection('burger')
        .get();

    querySnapshot.docs.forEach((burger) {
      _burgerCategoriesModel = FoodCategoriesModel(
        image: burger.data()['image'],
        name: burger.data()['name'],
        price: burger.data()['price'],
      );
      newBurgerCategories.add(_burgerCategoriesModel);
      _burgerCategories = newBurgerCategories;
    });
  }

  /// category list [pizza]
  FoodCategoriesModel? _piazzaCategoriesModel;
  List<FoodCategoriesModel?> _pizzaCategories = [];

  List<FoodCategoriesModel?> get pizzaCategories => _pizzaCategories;

  Future<void> fetchPizzasList() async {
    var newPizzaCategories = <FoodCategoriesModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('food-categories')
        .doc('GtAM48SvhcK8JsfkxAkJ')
        .collection('pizza')
        .get();

    querySnapshot.docs.forEach((pizza) {
      _piazzaCategoriesModel = FoodCategoriesModel(
        image: pizza.data()['image'],
        name: pizza.data()['name'],
        price: pizza.data()['price'],
      );
      newPizzaCategories.add(_piazzaCategoriesModel);
      _pizzaCategories = newPizzaCategories;
    });
  }

  /// category list [steak]
  FoodCategoriesModel? _steakCategoriesModel;
  List<FoodCategoriesModel?> _steakCategories = [];

  List<FoodCategoriesModel?> get steakCategories => _steakCategories;

  Future<void> fetchSteaksList() async {
    var newSteakCategories = <FoodCategoriesModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('food-categories')
        .doc('GtAM48SvhcK8JsfkxAkJ')
        .collection('steak')
        .get();

    querySnapshot.docs.forEach((steak) {
      _steakCategoriesModel = FoodCategoriesModel(
        image: steak.data()['image'],
        name: steak.data()['name'],
        price: steak.data()['price'],
      );
      newSteakCategories.add(_steakCategoriesModel);
      _steakCategories = newSteakCategories;
    });
  }

  /// category list [salad]
  FoodCategoriesModel? _saladCategoriesModel;
  List<FoodCategoriesModel?> _saladCategories = [];

  List<FoodCategoriesModel?> get saladCategories => _saladCategories;

  Future<void> fetchSaladsList() async {
    var newSaladCategories = <FoodCategoriesModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('food-categories')
        .doc('GtAM48SvhcK8JsfkxAkJ')
        .collection('salad')
        .get();

    querySnapshot.docs.forEach((salad) {
      _saladCategoriesModel = FoodCategoriesModel(
        image: salad.data()['image'],
        name: salad.data()['name'],
        price: salad.data()['price'],
      );
      newSaladCategories.add(_saladCategoriesModel);
      _saladCategories = newSaladCategories;
    });
  }

  /// category list [biryani]
  FoodCategoriesModel? _biryaniCategoriesModel;
  List<FoodCategoriesModel?> _biryaniCategories = [];

  List<FoodCategoriesModel?> get biryaniCategories => _biryaniCategories;

  Future<void> fetchBiryanisList() async {
    var newBiryaniCategories = <FoodCategoriesModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('food-categories')
        .doc('GtAM48SvhcK8JsfkxAkJ')
        .collection('biryani')
        .get();

    querySnapshot.docs.forEach((biryani) {
      _biryaniCategoriesModel = FoodCategoriesModel(
        image: biryani.data()['image'],
        name: biryani.data()['name'],
        price: biryani.data()['price'],
      );
      newBiryaniCategories.add(_biryaniCategoriesModel);
      _biryaniCategories = newBiryaniCategories;
    });
  }

  /// category list [drink]
  FoodCategoriesModel? _drinkCategoriesModel;
  List<FoodCategoriesModel?> _drinkCategories = [];

  List<FoodCategoriesModel?> get drinkCategories => _drinkCategories;

  Future<void> fetchDrinksList() async {
    var newDrinkCategories = <FoodCategoriesModel?>[];
    var querySnapshot = await FirebaseFirestore.instance
        .collection('food-categories')
        .doc('GtAM48SvhcK8JsfkxAkJ')
        .collection('drink')
        .get();

    querySnapshot.docs.forEach((burger) {
      _drinkCategoriesModel = FoodCategoriesModel(
        image: burger.data()['image'],
        name: burger.data()['name'],
        price: burger.data()['price'],
      );
      newDrinkCategories.add(_drinkCategoriesModel);
      _drinkCategories = newDrinkCategories;
    });
  }

  /// add to cart
  CartModel? _cartModel;
  List<CartModel?> _carts = [];
  final List<CartModel?> _newCarts = [];

  List<CartModel?> get carts => _carts;

  void addToCart({
    required String? image,
    required String? name,
    required String? price,
    required String quantity,
  }) {
    _cartModel = CartModel(
      image: image,
      name: name,
      price: price,
      quantity: quantity,
    );
    _newCarts.add(_cartModel);
    _carts = _newCarts;
  }

  double totalPrice() {
    var total = 0.0;
    _carts.forEach((cart) {
      total += double.parse(cart!.price!) * double.parse(cart.quantity);
    });
    return total;
  }

  late int deleteIndex;
  void getDeleteIndex(int index) {
    deleteIndex = index;
  }

  void delete() {
    _carts.removeAt(deleteIndex);
    notifyListeners();
  }
}
