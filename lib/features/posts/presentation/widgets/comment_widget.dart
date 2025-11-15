import 'package:flutter/material.dart';
import 'package:pump/core/constants/app/app_strings.dart';
import 'package:pump/features/posts/domain/entities/post.dart';
import '../../../../core/constants/app/app_dimens.dart';
import '../../../../core/presentation/theme/app_colors.dart';
import '../../../../core/presentation/theme/app_text_styles.dart';
import '../../../../core/utils/ui_utils.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.spaceS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          comment.userProfileImageUrl == null
              ? CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: AppDimens.radiusL,
                  child: Text(
                    comment.userName[0],
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : CircleAvatar(
                  backgroundImage: AssetImage(comment.userProfileImageUrl!),
                  radius: AppDimens.radiusL,
                ),

          UiUtils.addHorizontalSpaceM(),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.userName,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),
                UiUtils.addVerticalSpaceXS(),
                Text(comment.comment, style: AppTextStyles.bodySmall),
                UiUtils.addVerticalSpaceXS(),
                Row(
                  children: [
                    Text(
                      "1d",
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textDisabled,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    UiUtils.addHorizontalSpaceXL(),
                    Text(
                      AppStrings.like,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textDisabled,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    UiUtils.addHorizontalSpaceXL(),
                    Text(
                      AppStrings.reply,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textDisabled,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: AppColors.textDisabled,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
