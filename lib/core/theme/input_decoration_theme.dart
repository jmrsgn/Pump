import 'package:flutter/material.dart';
import 'package:pump/core/constants/app_dimens.dart';
import 'app_colors.dart';

class AppInputDecorations {
  static const InputDecorationTheme defaultTheme = InputDecorationTheme(
    hintStyle: TextStyle(color: AppColors.textHint),
    prefixIconColor: AppColors.textHint,
    contentPadding: EdgeInsets.symmetric(
      vertical: AppDimens.textFieldVerticalPadding,
      horizontal: AppDimens.textFieldHorizontalPadding,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.textHint,
        width: AppDimens.textFieldEnabledBorderWidth,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(AppDimens.textFieldCornerRadius),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary,
        width: AppDimens.textFieldFocusedBorderWidth,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(AppDimens.textFieldCornerRadius),
      ),
    ),
  );
}
