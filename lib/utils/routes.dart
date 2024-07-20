import 'package:agri/views/auth/onboard.dart';
import 'package:agri/views/auth/wrapper.dart';
import 'package:agri/views/home/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeID:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case OnboardPage.routeID:
        return MaterialPageRoute(builder: (context) => const OnboardPage());

      default:
        return MaterialPageRoute(builder: (context) => const Wrapper());
    }
  }
}
