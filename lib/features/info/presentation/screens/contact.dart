import 'package:flutter/material.dart';
import 'package:pump/core/theme/app_colors.dart';
import 'package:pump/core/theme/app_text_styles.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_button_styles.dart';
import '../../../../core/utils/navigation_utils.dart';
import '../../../../core/utils/ui_utils.dart';
import '../../../../core/widgets/custom_text_field.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text(AppStrings.contact, style: AppTextStyles.appBarTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textOnPrimary),
            onPressed: () {
              NavigationUtils.handleBackNavigation(context);
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.spaceL),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Takes only as much as available height needed
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.letsTalk,
                      style: AppTextStyles.heading1.copyWith(fontSize: 42),
                    ),
                    Text(
                      AppStrings.isThereAnytingICanHelpYouWith,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),

                UiUtils.addVerticalSpaceXXL(),

                // Middle section
                Center(
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: AppStrings.name,
                        controller: _nameController,
                      ),

                      UiUtils.addVerticalSpaceS(),

                      CustomTextField(
                        hint: AppStrings.email,
                        controller: _emailController,
                      ),

                      UiUtils.addVerticalSpaceS(),

                      CustomTextField(
                        hint: AppStrings.phone,
                        controller: _phoneController,
                      ),

                      UiUtils.addVerticalSpaceS(),

                      CustomTextField(
                        hint: AppStrings.message,
                        controller: _messageController,
                        isMultiline: true,
                      ),
                    ],
                  ),
                ),

                UiUtils.addVerticalSpaceS(),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: AppButtonStyles.normal,
                    onPressed: () {},
                    child: const Text(AppStrings.submit),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
