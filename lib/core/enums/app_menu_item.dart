import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../routes.dart';

enum AppMenuItem {
  profile(
    title: AppStrings.profile,
    icon: Icon(Icons.person_outline),
    route: AppRoutes.userProfile,
  ),
  messages(
    title: AppStrings.messages,
    icon: Icon(Icons.message_outlined),
    route: AppRoutes.messages,
  ),
  favorites(
    title: AppStrings.favorites,
    icon: Icon(Icons.favorite_outline),
    route: AppRoutes.favorites,
  ),
  contact(
    title: AppStrings.contact,
    icon: Icon(Icons.phone),
    route: AppRoutes.contact,
  ),
  feedback(
    title: AppStrings.feedback,
    icon: Icon(Icons.feedback_outlined),
    route: AppRoutes.feedback,
  ),
  about(
    title: AppStrings.about,
    icon: Icon(Icons.info_outline),
    route: AppRoutes.about,
  );

  // --- Fields ---
  final String title;
  final Widget icon;
  final String route;

  const AppMenuItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}
