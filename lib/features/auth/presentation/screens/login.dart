import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pump/core/constants/strings.dart';
import 'package:pump/core/routes.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';
import 'package:pump/core/widgets/custom_text_field.dart';
import 'package:pump/core/constants/dimens.dart';
import 'package:pump/core/theme/app_colors.dart';

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
            Container(
              color: Colors.black.withValues(alpha: 0.4), // 40% opacity
            ),

            // Main content
            Center(
              child: Padding(
                padding: const EdgeInsets.all(ScaffoldDimens.padding),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Takes only as much as available height needed
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top left section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          AppStrings.appName,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: TextFieldDimens.title,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          AppStrings.allYouNeedInOneApp,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: TextFieldDimens.description,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: MarginDimens.margin40),

                    // Middle section
                    Center(
                      child: Column(
                        children: [
                          CustomTextField(
                            hint: AppStrings.username,
                            controller: _usernameController,
                            prefixIcon: Icons.person,
                          ),

                          const SizedBox(height: MarginDimens.margin20),

                          CustomTextField(
                            hint: AppStrings.password,
                            controller: _passwordController,
                            prefixIcon: Icons.lock,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: MarginDimens.margin20),

                    // Lower right section
                    Align(
                      alignment: AlignmentGeometry.bottomRight,
                      child: SizedBox(
                        width: ButtonDimens.width120,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.textPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                ButtonDimens.radius,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: ButtonDimens.paddingVertical,
                              horizontal: ButtonDimens.paddingHorizontal,
                            ),
                          ),
                          onPressed: () {
                            final username = _usernameController.text.trim();
                            final password = _passwordController.text.trim();

                            login();

                            if (username.isNotEmpty && password.isNotEmpty) {
                              // TODO proceed with Auth process then go to feed
                            }
                          },
                          child: const Text(
                            AppStrings.login,
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: TextFieldDimens.description,
                            ),
                          ),
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
                padding: EdgeInsets.only(bottom: MarginDimens.margin20),
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: TextFieldDimens.description,
                    ),
                    children: [
                      TextSpan(
                        text: "Register here",
                        style: TextStyle(
                          color: Colors.orange, // TODO: Fix
                          fontSize: TextFieldDimens.description,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Go to registration screen");
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
