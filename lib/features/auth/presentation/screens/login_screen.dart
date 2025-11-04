import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/constants/app/app_constants.dart';
import 'package:pump/core/routes.dart';
import 'package:pump/core/theme/app_button_styles.dart';
import 'package:pump/core/utils/navigation_utils.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';
import 'package:pump/core/widgets/custom_text_field.dart';
import 'package:pump/core/theme/app_colors.dart';

import '../../../../core/constants/app/app_dimens.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/presentation/providers/ui_state.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../providers/auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<UiState>(authViewModelProvider, (previous, next) {
      if (previous?.isLoading == true && next.isLoading == false) {
        if (next.errorMessage == null) {
          if (!mounted) return;
          UiUtils.showSnackBarSuccess(
            context,
            message: AppStrings.successfullyLoggedIn,
          );
          NavigationUtils.replaceWith(context, AppRoutes.mainFeed);
        } else {
          if (!mounted) return;
          UiUtils.showSnackBarError(context, message: next.errorMessage!);
        }
      }
    });

    final authState = ref.watch(authViewModelProvider);
    final authViewModel = ref.watch(authViewModelProvider.notifier);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScaffold(
        isLoading: authState.isLoading,
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/home.png', fit: BoxFit.cover),
            Container(color: AppColors.overlay),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.spaceL),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConstants.appName,
                          style: AppTextStyles.heading1.copyWith(fontSize: 42),
                        ),
                        Text(
                          AppStrings.allYouNeedInOneApp,
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                    UiUtils.addVerticalSpaceXXL(),
                    Center(
                      child: Column(
                        children: [
                          CustomTextField(
                            hint: AppStrings.email,
                            controller: _emailController,
                          ),
                          UiUtils.addVerticalSpaceM(),
                          CustomTextField(
                            hint: AppStrings.password,
                            controller: _passwordController,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                    UiUtils.addVerticalSpaceM(),
                    Align(
                      alignment: AlignmentGeometry.bottomRight,
                      child: SizedBox(
                        width: AppDimens.buttonSmallWidth,
                        child: ElevatedButton(
                          style: AppButtonStyles.normal,
                          onPressed: authState.isLoading
                              ? null
                              : () {
                                  final email = _emailController.text.trim();
                                  final password = _passwordController.text
                                      .trim();
                                  authViewModel.login(email, password);
                                  // No need to check authState here — ref.listen handles it
                                },
                          child: const Text(AppStrings.login),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
