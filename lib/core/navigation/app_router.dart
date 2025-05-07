import 'package:flutter/material.dart';
import 'package:krap/core/navigation/route_paths.dart';

class AppRouter {
  static void goLogin(BuildContext context) {
    Navigator.pushNamed(context, RoutePaths.login);
  }

  static void goTutorial(BuildContext context) {
    Navigator.pushNamed(context, RoutePaths.tutorial);
  }

  static void goHome(BuildContext context) {
    Navigator.pushNamed(context, RoutePaths.home);
  }

  static void replaceHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, RoutePaths.home);
  }
}
