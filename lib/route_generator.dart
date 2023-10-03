import 'package:first_app/view/food_page.dart';
import 'package:first_app/view/home_page.dart';
import 'package:first_app/view/items_page.dart';
import 'package:first_app/view/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String splashScreen = '/';
  static const String homePage = '/home';
  static const String foodPage = '/food';
  static const String itemsPage = '/items';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case foodPage:
        return MaterialPageRoute(builder: (_) => const FoodPage());
      case itemsPage:
        return MaterialPageRoute(builder: (_) => const ItemsPage());
      default:
        throw const FormatException("Route Not Found..!!");
    }
  }
}

class RouteException implements Exception {
  final String message;
  RouteException(this.message);
}
