import 'package:flutter/cupertino.dart';
import 'package:pump/core/constants/app_strings.dart';
import 'package:pump/core/theme/app_colors.dart';
import 'package:pump/core/theme/app_text_styles.dart';

import '../constants/app_dimens.dart';

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
        child: Text(AppStrings.copyright, style: AppTextStyles.footer),
      ),
    );
  }

  static Widget addSpace({double height = 0, double width = 0}) {
    return SizedBox(height: height, width: width);
  }

  // Vertical Spaces
  static Widget addVerticalSpaceXS() {
    return SizedBox(height: AppDimens.spaceXS);
  }

  static Widget addVerticalSpaceS() {
    return SizedBox(height: AppDimens.spaceS);
  }

  static Widget addVerticalSpaceM() {
    return SizedBox(height: AppDimens.spaceM);
  }

  static Widget addVerticalSpaceL() {
    return SizedBox(height: AppDimens.spaceL);
  }

  static Widget addVerticalSpaceXL() {
    return SizedBox(height: AppDimens.spaceXL);
  }

  static Widget addVerticalSpaceXXL() {
    return SizedBox(height: AppDimens.spaceXXL);
  }

  // Horizontal Spaces
  static Widget addHorizontalSpaceXS() {
    return SizedBox(width: AppDimens.spaceXS);
  }

  static Widget addHorizontalSpaceS() {
    return SizedBox(width: AppDimens.spaceS);
  }

  static Widget addHorizontalSpaceM() {
    return SizedBox(width: AppDimens.spaceM);
  }

  static Widget addHorizontalSpaceL() {
    return SizedBox(width: AppDimens.spaceL);
  }

  static Widget addHorizontalSpaceXL() {
    return SizedBox(width: AppDimens.spaceXL);
  }

  static Widget addHorizontalSpaceXXL() {
    return SizedBox(width: AppDimens.spaceXXL);
  }
}
