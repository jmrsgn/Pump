import 'package:flutter/cupertino.dart';
import 'package:pump/core/constants/strings.dart';
import 'package:pump/core/theme/app_colors.dart';
import 'package:pump/core/theme/app_text_styles.dart';

import '../constants/dimens.dart';

class UiUtils {
  static Widget addDivider() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimens.dimen4),
      child: SizedBox(
        height: AppDimens.dimen8,
        width: AppDimens.dimen48,
        child: Container(color: AppColors.primary),
      ),
    );
  }

  static Widget addCopyright() {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.dimen8),
      child: Center(
        child: Text(AppStrings.copyright, style: AppTextStyles.copyright),
      ),
    );
  }

  static Widget addSpace({double height = 0, double width = 0}) {
    return SizedBox(height: height, width: width);
  }

  // Vertical Spaces
  static Widget addVerticalSpaceExtraSmall() {
    return SizedBox(height: AppDimens.dimen8);
  }

  static Widget addVerticalSpaceSmall() {
    return SizedBox(height: AppDimens.dimen12);
  }

  static Widget addVerticalSpaceMedium() {
    return SizedBox(height: AppDimens.dimen24);
  }

  static Widget addVerticalSpaceLarge() {
    return SizedBox(height: AppDimens.dimen36);
  }

  static Widget addVerticalSpaceExtraLarge() {
    return SizedBox(height: AppDimens.dimen48);
  }

  // Horizontal Spaces
  static Widget addHorizontalSpaceExtraSmall() {
    return SizedBox(width: AppDimens.dimen8);
  }
}
