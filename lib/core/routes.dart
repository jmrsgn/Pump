import 'package:flutter/material.dart';
import 'package:pump/core/constants/strings.dart';
import 'package:pump/features/auth/presentation/screens/login.dart';
import 'package:pump/features/posts/presentation/screens/main_feed.dart';

class AppRoutes {
  static const String login = '/login';
  static const String mainFeed = '/main_feed';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case mainFeed:
        return MaterialPageRoute(builder: (_) => const MainFeedScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text(AppStrings.routeNotFound)),
          ),
        );
    }
  }
}
