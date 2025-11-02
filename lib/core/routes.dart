import 'package:flutter/material.dart';
import 'package:pump/core/screens/invalid_route.dart';
import 'package:pump/features/auth/presentation/screens/login_screen.dart';
import 'package:pump/features/auth/presentation/screens/register_screen.dart';
import 'package:pump/features/chat/presentation/screens/messages.dart';
import 'package:pump/features/info/presentation/screens/contact.dart';
import 'package:pump/features/info/presentation/screens/feedback.dart';
import 'package:pump/features/posts/presentation/screens/create_post_screen.dart';
import 'package:pump/features/posts/presentation/screens/favorites_screen.dart';
import '../features/info/presentation/screens/about.dart';
import '../features/posts/presentation/screens/main_feed_screen.dart';
import '../features/user/presentation/screens/user_profile.dart';

class AppRoutes {
  // Auth
  static const String login = '/login';
  static const String register = '/register';

  // Posts
  static const String mainFeed = '/main_feed';
  static const String favorites = '/favorites';
  static const String createPost = '/create_post';

  // User
  static const String userProfile = '/user_profile';
  static const String messages = '/messages';

  // Info
  static const String contact = '/contact';
  static const String feedback = '/feedback';
  static const String about = '/about';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case mainFeed:
        return MaterialPageRoute(builder: (_) => const MainFeedScreen());
      case favorites:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      case createPost:
        return MaterialPageRoute(builder: (_) => const CreatePostScreen());
      case userProfile:
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());
      case messages:
        return MaterialPageRoute(
          builder: (_) =>
              const MessagesScreen(titleName: "John Martin Marasigan"),
        );
      case contact:
        return MaterialPageRoute(builder: (_) => const ContactScreen());
      case feedback:
        return MaterialPageRoute(builder: (_) => const FeedbackScreen());
      case about:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      default:
        return MaterialPageRoute(builder: (_) => InvalidRouteScreen());
    }
  }
}
