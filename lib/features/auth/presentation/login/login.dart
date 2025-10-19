import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pump/core/constants/app_strings.dart';
import 'package:pump/core/routes.dart';
import 'package:pump/core/theme/app_button_styles.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';
import 'package:pump/core/widgets/custom_text_field.dart';
import 'package:pump/core/constants/app_dimens.dart';
import 'package:pump/core/theme/app_colors.dart';

import '../../../../core/theme/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool _isLoading = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    // setState(() {
    //   _isLoading = true;
    // });
    //
    // await Future.delayed(const Duration(seconds: 2));
    //
    // setState(() {
    //   _isLoading = false;
    // });

    Navigator.pushReplacementNamed(context, AppRoutes.mainFeed);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScaffold(
        isLoading: _isLoading,
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
                padding: const EdgeInsets.all(AppDimens.dimen14),
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
                          onPressed: () {
                            final username = _usernameController.text.trim();
                            final password = _passwordController.text.trim();

                            login();

                            if (username.isNotEmpty && password.isNotEmpty) {
                              // TODO proceed with Auth process then go to feed
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
                            // TODO: Navigate to registration screen
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
