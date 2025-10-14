import 'package:flutter/material.dart';
import 'package:pump/core/constants/strings.dart';
import 'package:pump/core/theme/app_text_styles.dart';
import 'package:pump/core/utils/navigation_utils.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

import '../../core/constants/dimens.dart';
import '../../core/theme/app_colors.dart';

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
          padding: EdgeInsets.all(AppDimens.dimen12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(AppStrings.aboutPage, style: AppTextStyles.heading1),
                    UiUtils.addVerticalSpaceSmall(),
                    Icon(
                      Icons.question_mark,
                      size: 150,
                    ), // TODO: replace with app logo
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    UiUtils.addVerticalSpaceSmall(),
                    Text(
                      AppStrings.placeholderParagraph2,
                      style: AppTextStyles.body,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              UiUtils.addVerticalSpaceLarge(),
              UiUtils.addDivider(),
              UiUtils.addVerticalSpaceLarge(),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(AppStrings.inspiration, style: AppTextStyles.heading3),
                    UiUtils.addVerticalSpaceSmall(),
                    Text(
                      AppStrings.placeholderParagraph,
                      style: AppTextStyles.body,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              UiUtils.addVerticalSpaceLarge(),
              UiUtils.addDivider(),
              UiUtils.addVerticalSpaceLarge(),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(AppStrings.howItWorks, style: AppTextStyles.heading3),
                    UiUtils.addVerticalSpaceSmall(),
                    Text(
                      AppStrings.placeholderParagraph2,
                      style: AppTextStyles.body,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              UiUtils.addVerticalSpaceExtraLarge(),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(AppStrings.developer, style: AppTextStyles.heading1),
                    UiUtils.addVerticalSpaceSmall(),
                    const CircleAvatar(
                      radius: AppDimens.dimen64,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: AppDimens.dimen86,
                      ), // TODO fix color
                    ),
                    UiUtils.addVerticalSpaceSmall(),
                    Text(
                      AppStrings.placeholderParagraph2,
                      style: AppTextStyles.body,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              UiUtils.addVerticalSpaceLarge(),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      AppStrings.contactDetails,
                      style: AppTextStyles.heading3,
                    ),
                    UiUtils.addVerticalSpaceSmall(),
                    _buildContactTile(
                      title: AppStrings.email,
                      subtitle: AppStrings.devEmail,
                      leading: Icon(Icons.email),
                    ),
                    UiUtils.addVerticalSpaceExtraSmall(),
                    _buildContactTile(
                      title: AppStrings.mobileNo,
                      subtitle: AppStrings.devMobileNo,
                      leading: Icon(Icons.call),
                    ),
                    UiUtils.addVerticalSpaceExtraSmall(),
                    _buildContactTile(
                      title: AppStrings.github,
                      subtitle: AppStrings.devGithubUsername,
                      leading: Icon(Icons.code),
                    ),
                  ],
                ),
              ),
              UiUtils.addVerticalSpaceExtraLarge(),
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
        borderRadius: BorderRadius.circular(AppDimens.dimen8),
      ),
      tileColor: AppColors.surface,
      leading: leading,
      trailing: IconButton(onPressed: null, icon: Icon(Icons.open_in_new)),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
