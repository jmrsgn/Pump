import 'package:flutter/material.dart';
import 'package:pump/core/theme/app_text_styles.dart';
import '../constants/app_dimens.dart';
import 'app_colors.dart';

class AppButtonStyles {
  static final normal = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.primary),
    foregroundColor: WidgetStateProperty.all(AppColors.textOnPrimary),
    padding: WidgetStateProperty.all(
      EdgeInsets.symmetric(
        vertical: AppDimens.buttonVerticalPadding,
        horizontal: AppDimens.buttonHorizontalPadding,
      ),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.buttonCornerRadius),
      ),
    ),
    textStyle: WidgetStateProperty.all(AppTextStyles.button),
  );

  static final outlined = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
    foregroundColor: WidgetStateProperty.all(AppColors.primary),
    side: WidgetStateProperty.all(
      BorderSide(
        color: AppColors.primary,
        width: AppDimens.buttonOutlineBorderWidth,
      ),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.buttonCornerRadius),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: AppDimens.buttonVerticalPadding,
        horizontal: AppDimens.buttonHorizontalPadding,
      ),
    ),
  );
}
