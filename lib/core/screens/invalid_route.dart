import 'package:flutter/material.dart';
import 'package:pump/core/constants/app_dimens.dart';
import 'package:pump/core/constants/app_strings.dart';
import 'package:pump/core/theme/app_colors.dart';
import 'package:pump/core/theme/app_text_styles.dart';
import 'package:pump/core/utils/navigation_utils.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

class InvalidRouteScreen extends StatelessWidget {
  const InvalidRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => NavigationUtils.handleBackNavigation(context),
          icon: Icon(Icons.arrow_back, color: AppColors.textOnPrimary),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(AppDimens.dimen24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: AppDimens.dimen12),
                Text(AppStrings.routeNotFound, style: AppTextStyles.body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
