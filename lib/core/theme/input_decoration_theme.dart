import 'package:flutter/material.dart';
import 'package:pump/core/constants/dimens.dart';
import 'app_colors.dart';

class AppInputDecorations {
  static const InputDecorationTheme defaultTheme = InputDecorationTheme(
    hintStyle: TextStyle(color: AppColors.textHint),
    prefixIconColor: AppColors.textHint,
    contentPadding: EdgeInsets.symmetric(
      vertical: TextFieldDimens.paddingVertical,
      horizontal: TextFieldDimens.paddingHorizontal,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: TextFieldDimens.enabledBorderWidth,
      ),
      borderRadius: BorderRadius.all(Radius.circular(TextFieldDimens.radius)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary,
        width: TextFieldDimens.focusedBorderWidth,
      ),
      borderRadius: BorderRadius.all(Radius.circular(TextFieldDimens.radius)),
    ),
  );

  // static InputDecoration base({
  //   String? label,
  //   String? hint,
  //   IconData? prefixIcon,
  // }) {
  //   return InputDecoration(
  //     labelText: label,
  //     hintText: hint,
  //     prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
  //     border: const OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(TextFieldDimens.radius)),
  //     ),
  //     contentPadding: EdgeInsets.symmetric(
  //       vertical: TextFieldDimens.paddingVertical,
  //       horizontal: TextFieldDimens.paddingHorizontal,
  //     ),
  //   );
  // }
}
