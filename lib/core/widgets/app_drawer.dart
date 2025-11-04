import 'package:flutter/material.dart';
import 'package:pump/core/enums/app_menu_item.dart';
import 'package:pump/core/utils/ui_utils.dart';

import '../constants/app/app_dimens.dart';
import '../constants/app/app_strings.dart';
import '../domain/entities/user.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppDrawer extends StatelessWidget {
  final String selectedRoute;
  final VoidCallback onSignOut;
  final User currentUser;

  const AppDrawer({
    super.key,
    required this.selectedRoute,
    required this.onSignOut,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.drawerPadding),
            decoration: const BoxDecoration(color: AppColors.background),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/jm.jpg"),
                  radius: AppDimens.radiusXXXL,
                ),

                UiUtils.addHorizontalSpaceL(),

                Expanded(
                  child: Container(
                    color: AppColors.background,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${currentUser.firstName} ${currentUser.lastName}",
                          style: AppTextStyles.heading2,
                        ),
                        Text(currentUser.email, style: AppTextStyles.bodySmall),
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

          const Divider(color: Colors.white24), // Border before sign out tile

          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.error),
            title: const Text(
              AppStrings.signOut,
              style: TextStyle(color: AppColors.error),
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
        Navigator.pop(context); // Close the drawer first

        if (selectedRoute != item.route) {
          Navigator.pushNamed(context, item.route);
        }
      },
    );
  }
}
