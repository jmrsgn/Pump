import 'package:flutter/material.dart';
import 'package:pump/core/constants/strings.dart';
import 'package:pump/core/theme/app_text_styles.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

import '../../../../core/constants/dimens.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/navigation_utils.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(AppStrings.profile, style: AppTextStyles.heading3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textOnPrimary),
          onPressed: () {
            NavigationUtils.handleBackNavigation(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimens.dimen8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  UiUtils.addVerticalSpaceSmall(),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/sample.jpg"),
                    radius: AppDimens.dimen64,
                  ),
                  UiUtils.addVerticalSpaceMedium(),
                  Text(
                    "Name ng Client o Coach",
                    style: AppTextStyles.heading3,
                  ),
                  Text(
                    "sample@gmail.com",
                    style: AppTextStyles.body,
                  ),
                  UiUtils.addVerticalSpaceExtraSmall(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, color: AppColors.success, size: 8),
                      UiUtils.addHorizontalSpaceExtraSmall(),
                      Text("Active", style: AppTextStyles.hint),
                    ],
                  ),
                ],
              ),
            ),
            UiUtils.addVerticalSpaceExtraLarge(),
            _buildProfileSettingsTitle(
              title: AppStrings.editProfile,
              leading: Icon(Icons.edit),
            ),
            UiUtils.addVerticalSpaceExtraSmall(),
            _buildProfileSettingsTitle(
              title: AppStrings.paymentMethod,
              leading: Icon(Icons.payment),
            ),
            UiUtils.addVerticalSpaceExtraSmall(),
            _buildProfileSettingsTitle(
              title: AppStrings.clients,
              leading: Icon(Icons.group),
            ),
            UiUtils.addVerticalSpaceExtraSmall(),
            _buildProfileSettingsTitle(
              title: AppStrings.coach,
              leading: Icon(Icons.person),
            ),
            UiUtils.addVerticalSpaceExtraSmall(),
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
        borderRadius: BorderRadius.circular(AppDimens.dimen8),
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
