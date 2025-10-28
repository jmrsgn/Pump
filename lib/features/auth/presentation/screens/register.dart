import 'package:flutter/material.dart';
import 'package:pump/core/constants/app_dimens.dart';
import 'package:pump/core/constants/app_strings.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

import '../../../../core/theme/app_button_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/navigation_utils.dart';
import '../../../../core/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool isCoach = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textOnPrimary),
            onPressed: () {
              NavigationUtils.handleBackNavigation(context);
            },
          ),
        ),
        body: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppDimens.pagePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UiUtils.addVerticalSpaceS(),
                    Text(
                      AppStrings.userRegistration,
                      style: AppTextStyles.heading2,
                    ),
                    UiUtils.addVerticalSpaceXXL(),

                    // First Name + Last Name
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hint: AppStrings.firstName,
                            controller: _firstNameController,
                          ),
                        ),
                        UiUtils.addHorizontalSpaceS(),
                        Expanded(
                          child: CustomTextField(
                            hint: AppStrings.lastName,
                            controller: _lastNameController,
                          ),
                        ),
                      ],
                    ),
                    UiUtils.addVerticalSpaceM(),

                    // Username
                    CustomTextField(
                      hint: AppStrings.username,
                      controller: _usernameController,
                    ),
                    UiUtils.addVerticalSpaceM(),

                    // Email
                    CustomTextField(
                      hint: AppStrings.email,
                      controller: _emailController,
                    ),
                    UiUtils.addVerticalSpaceM(),

                    // Phone
                    CustomTextField(
                      hint: AppStrings.phone,
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior
                            .always, // prefix always visible
                        prefix: Text(
                          '+63 ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    UiUtils.addVerticalSpaceM(),

                    // Role toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "${AppStrings.iAmSigningUpAsA} ",
                            style: AppTextStyles.body,
                            children: [
                              TextSpan(
                                text: isCoach
                                    ? AppStrings.coach
                                    : AppStrings.client,
                                style: AppTextStyles.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        UiUtils.addHorizontalSpaceXS(),
                        Switch(
                          activeThumbColor: AppColors.primary,
                          value: isCoach,
                          onChanged: (value) {
                            setState(() {
                              isCoach = value;
                            });
                          },
                        ),
                      ],
                    ),
                    UiUtils.addVerticalSpaceL(),
                    UiUtils.addDivider(),
                    UiUtils.addVerticalSpaceXXL(),

                    SizedBox(
                      width: AppDimens.buttonMediumWidth,
                      child: ElevatedButton(
                        style: AppButtonStyles.normal,
                        onPressed: () {},
                        child: const Text(AppStrings.register),
                      ),
                    ),
                    UiUtils.addVerticalSpaceXXL(),
                  ],
                ),
              ),
            ),

            // Footer pinned to bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: UiUtils.addCopyright(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
