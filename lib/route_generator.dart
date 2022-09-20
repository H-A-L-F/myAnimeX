import 'package:flutter/material.dart';
import 'package:myanimex/main.dart';
import 'package:myanimex/pages/Detail/detail_page.dart';
import 'package:myanimex/pages/Home/home_page.dart';
import 'package:myanimex/pages/Items/items_page.dart';
import 'package:myanimex/pages/Login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/home':
        String? email = prefs!.getString('email');
        if (email != null && email != '') {
          if (args is String) {
            return MaterialPageRoute(
              builder: (context) => HomePage(
                email: args,
              ),
            );
          }
        }
        return _errorRoute();
      case '/detail':
        if (args is Merch) {
          return MaterialPageRoute(
            builder: (context) => DetailPage(currMerch: args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  });
}
