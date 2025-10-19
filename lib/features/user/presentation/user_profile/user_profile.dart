import 'package:flutter/material.dart';
import 'package:pump/core/constants/app_strings.dart';
import 'package:pump/core/theme/app_text_styles.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/navigation_utils.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(AppStrings.profile, style: AppTextStyles.appBarTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textOnPrimary),
          onPressed: () {
            NavigationUtils.handleBackNavigation(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimens.pagePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  UiUtils.addVerticalSpaceS(),

                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/sample.jpg"),
                    radius: AppDimens.dimen64,
                  ),

                  UiUtils.addVerticalSpaceM(),

                  Text("Name ng Client o Coach", style: AppTextStyles.heading1),
                  Text("sample@gmail.com", style: AppTextStyles.body),

                  UiUtils.addVerticalSpaceS(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, color: AppColors.success, size: 8),
                      UiUtils.addHorizontalSpaceXS(),
                      Text(AppStrings.active, style: AppTextStyles.bodySmall),
                    ],
                  ),
                ],
              ),
            ),
            UiUtils.addVerticalSpaceXL(),
            _buildProfileSettingsTitle(
              title: AppStrings.editProfile,
              leading: Icon(Icons.edit),
            ),
            UiUtils.addVerticalSpaceXS(),
            _buildProfileSettingsTitle(
              title: AppStrings.paymentMethod,
              leading: Icon(Icons.payment),
            ),
            UiUtils.addVerticalSpaceXS(),
            _buildProfileSettingsTitle(
              title: AppStrings.clients,
              leading: Icon(Icons.group),
            ),
            UiUtils.addVerticalSpaceXS(),
            _buildProfileSettingsTitle(
              title: AppStrings.coach,
              leading: Icon(Icons.person),
            ),
            UiUtils.addVerticalSpaceXS(),
            _buildProfileSettingsTitle(
              title: AppStrings.help,
              leading: Icon(Icons.help),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSettingsTitle({
    required String title,
    required Widget leading,
  }) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusM),
      ),
      tileColor: AppColors.surface,
      leading: leading,
      trailing: IconButton(
        onPressed: null,
        icon: Icon(Icons.keyboard_arrow_right),
      ),
      title: Text(title),
    );
  }
}
