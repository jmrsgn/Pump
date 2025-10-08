import 'package:flutter/material.dart';
import 'package:pump/core/constants/strings.dart';
import 'package:pump/core/enums/app_menu_item.dart';
import 'package:pump/core/routes.dart';
import '../constants/dimens.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppDrawer extends StatelessWidget {
  final String selectedRoute;
  final VoidCallback onSignOut;
  final String userName;
  final String email;

  const AppDrawer({
    super.key,
    required this.selectedRoute,
    required this.onSignOut,
    this.userName = "John",
    this.email = "marasiganjohnmartin@gmail.com",
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.symmetric(horizontal: PaddingDimens.padding20),
            decoration: const BoxDecoration(color: AppColors.background),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: IconDimens.iconSizeLarge,
                  color: Colors.white,
                ),
                const SizedBox(width: MarginDimens.margin30),
                Expanded(
                  child: Container(
                    color: AppColors.background,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userName, style: AppTextStyles.heading1),
                        Text(email, style: AppTextStyles.small),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 🔥 Loop through enum values here
          for (final item in AppMenuItem.values)
            _buildDrawerItem(context: context, item: item),

          const Divider(color: Colors.white30),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              AppStrings.signOut,
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: onSignOut,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required AppMenuItem item,
  }) {
    final bool isSelected = selectedRoute == item.route;

    return ListTile(
      leading: item.icon,
      title: Text(
        item.title,
        style: TextStyle(
          color: isSelected ? AppColors.textOnPrimary : AppColors.textPrimary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: AppColors.drawerSelected,
      onTap: () {
        if (selectedRoute != item.route) {
          // Navigator.pushReplacementNamed(context, item.route); // TODO
        } else {
          Navigator.pop(context); // just close the drawer
        }
      },
    );
  }
}
