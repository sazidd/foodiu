// import 'package:flutter/material.dart';
// import 'package:food_delivery/models/food_categories_model.dart';
// import 'package:food_delivery/pages/categories_page.dart';
// import 'package:food_delivery/pages/detail_page.dart';
// import 'package:food_delivery/pages/home_page.dart';
// import 'package:food_delivery/pages/login_page.dart';
// import 'package:food_delivery/pages/register_page.dart';
//
// class RouteGenerator {
//   static const loginPage = '/';
//   static const registerPage = '/register';
//   static const homePage = '/home';
//   static const detailPage = '/detail';
//   static const categoriesPage = '/categories';
//
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     final args = settings.arguments;
//     switch (settings.name) {
//       case loginPage:
//         return MaterialPageRoute(builder: (_) => LoginPage());
//       case registerPage:
//         return MaterialPageRoute(builder: (_) => RegisterPage());
//       case homePage:
//         return MaterialPageRoute(builder: (_) => HomePage());
//       case detailPage:
//         return MaterialPageRoute(
//           builder: (_) => DetailPage(),
//         );
//       case categoriesPage:
//         return MaterialPageRoute(
//           builder: (_) => CategoriesPage(
//             foodCategoriesModel: args as List<FoodCategoriesModel>,
//           ),
//         );
//       default:
//         return _errorRoute();
//     }
//   }
//
//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(
//       builder: (_) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Error'),
//           ),
//           body: Center(
//             child: Text('ERROR'),
//           ),
//         );
//       },
//     );
//   }
// }
