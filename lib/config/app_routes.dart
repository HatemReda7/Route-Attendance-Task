import 'package:attendance_task_route/core/utils/app_style.dart';
import 'package:attendance_task_route/features/Home%20Layout/presentation/pages/home_layout.dart';
import 'package:attendance_task_route/features/splash_screen.dart';
import 'package:flutter/material.dart';
import '../features/Home Layout/data/models/product_model.dart';
import '../features/Home Layout/presentation/pages/product_details_screen.dart';

class Routes {
  static const String splash = "/";
  static const String productDetailsScreen = "Product Details Screen";
  static const String homeScreen = "Home Screen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.productDetailsScreen:
        {
          final args = settings.arguments as Map<String, dynamic>;
          final i = args['product'] as Products;
          return MaterialPageRoute(builder: (_) => ProductDetailsScreen(i));
        }

      case Routes.splash:
        {
          return MaterialPageRoute(builder: (_) => const SplachScreen());
        }
      case Routes.homeScreen:
        {
          return MaterialPageRoute(builder: (_) => const HomePage());
        }

      default:
        return unDefinedScreen();
    }
  }

  static Route<dynamic> unDefinedScreen() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              "Not Found!",
              style: description,
            ),
          ),
        ));
  }
}