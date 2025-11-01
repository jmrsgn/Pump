import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/constants/app_dimens.dart';
import 'package:pump/core/constants/app_strings.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

import '../../../../core/routes.dart';
import '../../../../core/theme/app_button_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/navigation_utils.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../providers/auth_providers.dart';
import '../providers/auth_state.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isCoach = false;

  @override
  Widget build(BuildContext context) {
    // Listen for changes in authState to react after registration
    ref.listen<AuthState>(authViewModelProvider, (previous, next) {
      if (previous?.isLoading == true && next.isLoading == false) {
        if (next.errorMessage == null) {
          if (!mounted) return;
          UiUtils.showSnackBarSuccess(
            context,
            message: AppStrings.userRegisteredSuccessfully,
          );
          NavigationUtils.replaceWith(context, AppRoutes.login);
        } else {
          if (!mounted) return;
          UiUtils.showSnackBarError(context, message: next.errorMessage!);
        }
      }
    });

    final authState = ref.watch(authViewModelProvider);
    final authViewModel = ref.read(authViewModelProvider.notifier);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScaffold(
        isLoading: authState.isLoading,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textOnPrimary),
            onPressed: () => NavigationUtils.handleBackNavigation(context),
          ),
        ),
        body: Column(
          children: [
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
                    CustomTextField(
                      hint: AppStrings.email,
                      controller: _emailController,
                    ),
                    UiUtils.addVerticalSpaceM(),
                    CustomTextField(
                      hint: AppStrings.phone,
                      controller: _phoneController,
                    ),
                    UiUtils.addVerticalSpaceM(),
                    CustomTextField(
                      hint: AppStrings.password,
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    UiUtils.addVerticalSpaceM(),
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
                          onChanged: (value) => setState(() => isCoach = value),
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
                        onPressed: authState.isLoading
                            ? null
                            : () {
                                final firstName = _firstNameController.text;
                                final lastName = _lastNameController.text;
                                final email = _emailController.text;
                                final phone = _phoneController.text;
                                final role = isCoach ? 2 : 1;
                                final password = _passwordController.text;

                                // Just call register, UI reacts via ref.listen
                                authViewModel.register(
                                  firstName,
                                  lastName,
                                  email,
                                  phone,
                                  role,
                                  password,
                                );
                              },
                        child: const Text(AppStrings.register),
                      ),
                    ),
                    UiUtils.addVerticalSpaceXXL(),
                  ],
                ),
              ),
            ),
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

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
