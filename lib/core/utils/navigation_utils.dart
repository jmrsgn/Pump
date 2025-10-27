import 'package:flutter/material.dart';
import 'package:pump/core/routes.dart';

class NavigationUtils {
  static void handleBackNavigation(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  // Push a new route (keeps previous)
  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  // Replace current route (no going back)
  static void replaceWith(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  // Deletes all navigation stack and go to designated route
  static void navigateAndRemoveAll(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }
}
