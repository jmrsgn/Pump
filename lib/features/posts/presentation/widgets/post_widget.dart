import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/features/posts/domain/entities/post.dart';
import '../../../../core/constants/app/app_dimens.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/presentation/theme/app_colors.dart';
import '../../../../core/presentation/theme/app_text_styles.dart';
import '../../../../core/utils/time_utils.dart';

class PostWidget extends ConsumerStatefulWidget {
  final Post post;
  final VoidCallback? onTap;

  const PostWidget({super.key, required this.post, this.onTap});

  @override
  ConsumerState<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends ConsumerState<PostWidget>
    with RebuildEveryMinute {
  @override
  void initState() {
    super.initState();
    startMinuteRebuild();
  }

  @override
  void dispose() {
    stopMinuteRebuild();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final relativeTime = TimeUtils.timeAgo(widget.post.createdAt);

    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        color: AppColors.surface,
        margin: EdgeInsets.only(bottom: AppDimens.spaceXS),
        shape: RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.spaceS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header user info
              Container(
                padding: const EdgeInsets.all(AppDimens.spaceXS),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.post.userProfileImageUrl == null ||
                            widget.post.userProfileImageUrl!.isEmpty
                        ? CircleAvatar(
                            backgroundColor: AppColors.primary,
                            radius: AppDimens.radiusL,
                            child: Text(
                              widget.post.userName[0],
                              style: AppTextStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: AssetImage(
                              widget.post.userProfileImageUrl!,
                            ),
                            radius: AppDimens.radiusL,
                          ),

                    UiUtils.addHorizontalSpaceM(),

                    // Use Expanded to let name/status take flexible width
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.post.userName,
                            style: AppTextStyles.body.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            relativeTime,
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textDisabled,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              UiUtils.addVerticalSpaceS(),

              // Post info
              Container(
                padding: const EdgeInsets.all(AppDimens.spaceXS),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.post.title, style: AppTextStyles.heading3),
                    UiUtils.addVerticalSpaceS(),
                    Text(
                      widget.post.description,
                      style: AppTextStyles.body,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              UiUtils.addVerticalSpaceS(),

              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      if (false)
                        Icon(
                          Icons.favorite_outlined,
                          color: AppColors.textOnPrimary,
                        )
                      else
                        Icon(
                          Icons.favorite_border,
                          color: AppColors.textDisabled,
                        ),
                      UiUtils.addHorizontalSpaceXS(),
                      Text(
                        AppStrings.like,
                        style: false
                            ? AppTextStyles.caption.copyWith(
                                fontWeight: FontWeight.bold,
                              )
                            : AppTextStyles.caption.copyWith(
                                color: AppColors.textDisabled,
                              ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.mode_comment_outlined,
                        color: AppColors.textDisabled,
                      ),
                      UiUtils.addHorizontalSpaceXS(),
                      Text(
                        AppStrings.comment,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textDisabled,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.share, color: AppColors.textDisabled),
                      UiUtils.addHorizontalSpaceXS(),
                      Text(
                        AppStrings.share,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textDisabled,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
