import 'package:flutter/material.dart';
import 'package:pump/core/screens/invalid_route.dart';
import 'package:pump/features/auth/presentation/login/login.dart';
import 'package:pump/features/chat/presentation/screens/messages.dart';
import 'package:pump/features/info/presentation/screens/contact.dart';
import 'package:pump/features/info/presentation/screens/feedback.dart';
import 'package:pump/features/posts/presentation/screens/favorites.dart';
import '../features/info/presentation/screens/about.dart';
import '../features/posts/presentation/screens/main_feed.dart';
import '../features/user/presentation/screens/user_profile.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String mainFeed = '/screens';
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
      case profile:
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());
      case favorites:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      case contact:
        return MaterialPageRoute(builder: (_) => const ContactScreen());
      case feedback:
        return MaterialPageRoute(builder: (_) => const FeedbackScreen());
      case messages:
        return MaterialPageRoute(
          builder: (_) =>
              const MessagesScreen(titleName: "John Martin Marasigan"),
        );
      default:
        return MaterialPageRoute(builder: (_) => InvalidRouteScreen());
    }
  }
}
