import 'package:flutter/material.dart';
import 'package:pump/core/utils/ui_utils.dart';
import '../../../../core/constants/app/app_dimens.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/presentation/theme/app_colors.dart';
import '../../../../core/presentation/theme/app_text_styles.dart';

class PostWidget extends StatelessWidget {
  final String description;
  final String author;
  final String authorImageUrl;
  final String datePosted;
  final String? postImageUrl;
  final bool isLiked;

  const PostWidget({
    super.key,
    required this.description,
    required this.author,
    required this.authorImageUrl,
    required this.datePosted,
    this.postImageUrl,
    this.isLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      margin: EdgeInsets.only(bottom: AppDimens.spaceXS),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.spaceS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header user info
            Container(
              padding: const EdgeInsets.all(AppDimens.spaceXS),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: AppDimens.radiusL,
                    backgroundImage: AssetImage("assets/images/jm.jpg"),
                  ),

                  UiUtils.addHorizontalSpaceM(),

                  // Use Expanded to let name/status take flexible width
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          author,
                          style: AppTextStyles.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: AppColors.success,
                              size: 8,
                            ),
                            UiUtils.addHorizontalSpaceXS(),
                            Text(
                              AppStrings.active,
                              style: AppTextStyles.caption,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Date pinned to the right
                  Text(datePosted, style: AppTextStyles.caption),
                ],
              ),
            ),

            UiUtils.addVerticalSpaceS(),

            // Post description
            Container(
              padding: const EdgeInsets.all(AppDimens.spaceXS),
              child: Text(
                description,
                style: AppTextStyles.body,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            UiUtils.addVerticalSpaceS(),

            // Post image
            postImageUrl == null
                ? ClipRRect()
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      postImageUrl!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

            UiUtils.addVerticalSpaceS(),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    if (isLiked)
                      Icon(
                        Icons.favorite_outlined,
                        color: AppColors.textOnPrimary,
                      )
                    else
                      Icon(
                        Icons.favorite_border,
                        color: AppColors.textOnPrimary,
                      ),
                    UiUtils.addHorizontalSpaceXS(),
                    Text(
                      AppStrings.like,
                      style: isLiked
                          ? AppTextStyles.caption.copyWith(
                              fontWeight: FontWeight.bold,
                            )
                          : AppTextStyles.caption,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.mode_comment_outlined,
                      color: AppColors.textOnPrimary,
                    ),
                    UiUtils.addHorizontalSpaceXS(),
                    Text(AppStrings.comment, style: AppTextStyles.caption),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.share, color: AppColors.textOnPrimary),
                    UiUtils.addHorizontalSpaceXS(),
                    Text(AppStrings.share, style: AppTextStyles.caption),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
