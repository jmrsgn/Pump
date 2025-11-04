import 'package:flutter/material.dart';
import 'package:pump/core/theme/app_text_styles.dart';
import 'package:pump/core/utils/navigation_utils.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

import '../../../../core/constants/app/app_dimens.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/theme/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textOnPrimary),
          onPressed: () {
            NavigationUtils.handleBackNavigation(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimens.pagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(AppStrings.aboutPage, style: AppTextStyles.heading1),
                    UiUtils.addVerticalSpaceS(),
                    Icon(Icons.info, size: 150), // TODO: replace with app logo
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    UiUtils.addVerticalSpaceS(),
                    Text(
                      AppStrings.placeholderParagraph2,
                      style: AppTextStyles.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              _addDividerWithVerticalSpace(),

              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(AppStrings.inspiration, style: AppTextStyles.heading2),
                    UiUtils.addVerticalSpaceS(),
                    Text(
                      AppStrings.placeholderParagraph,
                      style: AppTextStyles.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              _addDividerWithVerticalSpace(),

              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(AppStrings.howItWorks, style: AppTextStyles.heading2),
                    UiUtils.addVerticalSpaceS(),
                    Text(
                      AppStrings.placeholderParagraph2,
                      style: AppTextStyles.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              _addDividerWithVerticalSpace(),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(AppStrings.developer, style: AppTextStyles.heading1),
                    UiUtils.addVerticalSpaceM(),
                    const CircleAvatar(
                      radius: AppDimens.dimen64,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: AppDimens.dimen86,
                      ), // TODO fix color
                    ),
                    UiUtils.addVerticalSpaceM(),
                    Text(
                      AppStrings.placeholderParagraph2,
                      style: AppTextStyles.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              _addDividerWithVerticalSpace(),

              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      AppStrings.contactDetails,
                      style: AppTextStyles.heading2,
                    ),
                    UiUtils.addVerticalSpaceS(),
                    _buildContactTile(
                      title: AppStrings.email,
                      subtitle: AppStrings.devEmail,
                      leading: Icon(Icons.email),
                    ),
                    UiUtils.addVerticalSpaceXS(),
                    _buildContactTile(
                      title: AppStrings.phone,
                      subtitle: AppStrings.devMobileNo,
                      leading: Icon(Icons.call),
                    ),
                    UiUtils.addVerticalSpaceXS(),
                    _buildContactTile(
                      title: AppStrings.github,
                      subtitle: AppStrings.devGithubUsername,
                      leading: Icon(Icons.code),
                    ),
                  ],
                ),
              ),
              UiUtils.addVerticalSpaceXL(),
              UiUtils.addCopyright(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactTile({
    required String title,
    required String subtitle,
    required Widget leading,
  }) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusM),
      ),
      tileColor: AppColors.surface,
      leading: leading,
      trailing: IconButton(onPressed: null, icon: Icon(Icons.open_in_new)),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  Widget _addDividerWithVerticalSpace() {
    return Column(
      children: [
        UiUtils.addVerticalSpaceXXL(),
        UiUtils.addDivider(),
        UiUtils.addVerticalSpaceXXL(),
      ],
    );
  }
}
