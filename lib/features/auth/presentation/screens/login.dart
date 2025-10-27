import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pump/core/constants/app_strings.dart';
import 'package:pump/core/routes.dart';
import 'package:pump/core/theme/app_button_styles.dart';
import 'package:pump/core/utils/navigation_utils.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';
import 'package:pump/core/widgets/custom_text_field.dart';
import 'package:pump/core/constants/app_dimens.dart';
import 'package:pump/core/theme/app_colors.dart';
import 'package:pump/features/auth/presentation/viewmodels/login_viewmodel.dart';

import '../../../../core/theme/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScaffold(
        isLoading: vm.isLoading,
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            // Background image
            Image.asset('assets/images/home.png', fit: BoxFit.cover),

            // Dark overlay
            Container(color: AppColors.overlay),

            // Main content
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.spaceL),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Takes only as much as available height needed
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top left section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.appName,
                          style: AppTextStyles.heading1.copyWith(fontSize: 42),
                        ),
                        Text(
                          AppStrings.allYouNeedInOneApp,
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),

                    UiUtils.addVerticalSpaceXXL(),

                    // Middle section
                    Center(
                      child: Column(
                        children: [
                          CustomTextField(
                            hint: AppStrings.username,
                            controller: _usernameController,
                            prefixIcon: Icons.person,
                          ),

                          UiUtils.addVerticalSpaceM(),

                          CustomTextField(
                            hint: AppStrings.password,
                            controller: _passwordController,
                            prefixIcon: Icons.lock,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),

                    UiUtils.addVerticalSpaceM(),

                    // Lower right section
                    Align(
                      alignment: AlignmentGeometry.bottomRight,
                      child: SizedBox(
                        width: AppDimens.buttonSmallWidth,
                        child: ElevatedButton(
                          style: AppButtonStyles.normal,
                          onPressed: vm.isLoading
                              ? null
                              : () async {
                                  final username = _usernameController.text
                                      .trim();
                                  final password = _passwordController.text
                                      .trim();

                                  await vm.login(username, password);

                                  // Prevents context misuse
                                  if (!context.mounted) return;

                                  if (vm.message == null) {
                                    UiUtils.showSnackbarSuccess(
                                      context,
                                      message: AppStrings.successfullyLoggedIn,
                                    );
                                    NavigationUtils.replaceWith(
                                      context,
                                      AppRoutes.mainFeed,
                                    );
                                  } else {
                                    UiUtils.showSnackbarError(
                                      context,
                                      message: vm.message.toString(),
                                    );
                                  }
                                },
                          child: const Text(AppStrings.login),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom text
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: AppDimens.spaceXXL),
                child: RichText(
                  text: TextSpan(
                    text: "${AppStrings.dontHaveAnAccount} ",
                    style: AppTextStyles.bodySmall,
                    children: [
                      TextSpan(
                        text: AppStrings.registerHere,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            NavigationUtils.navigateTo(
                              context,
                              AppRoutes.register,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
