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
}