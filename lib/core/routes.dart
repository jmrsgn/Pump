import 'package:flutter/material.dart';
import 'package:pump/core/screens/invalid_route.dart';
import 'package:pump/features/about/about.dart';
import 'package:pump/features/auth/presentation/login/login.dart';
import 'package:pump/features/posts/presentation/main_feed/main_feed.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String mainFeed = '/main_feed';
  static const String profile = '/profile';
  static const String messages = '/messages';
  static const String favorites = '/favorites';
  static const String contact = '/contact';
  static const String feedback = '/feedback';
  static const String about = '/about';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case mainFeed:
        return MaterialPageRoute(builder: (_) => const MainFeedScreen());
      case about:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      default:
        return MaterialPageRoute(builder: (_) => InvalidRouteScreen());
    }
  }
}
