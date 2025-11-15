import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/constants/app/app_dimens.dart';
import 'package:pump/core/constants/app/app_strings.dart';
import 'package:pump/core/presentation/theme/app_colors.dart';
import 'package:pump/core/presentation/theme/app_text_styles.dart';
import 'package:pump/core/presentation/widgets/custom_scaffold.dart';
import 'package:pump/core/utils/ui_utils.dart';
import 'package:pump/core/utils/time_utils.dart';
import 'package:pump/features/posts/domain/entities/post.dart';
import 'package:pump/features/posts/presentation/widgets/comment_widget.dart';

import '../../../../core/presentation/widgets/app_text_input.dart';
import '../../../../core/utils/navigation_utils.dart';

class PostInfoScreen extends ConsumerStatefulWidget {
  final Post post;

  const PostInfoScreen({super.key, required this.post});

  @override
  ConsumerState<PostInfoScreen> createState() => _PostInfoScreenState();
}

class _PostInfoScreenState extends ConsumerState<PostInfoScreen>
    with RebuildEveryMinute {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Focus on the input and show keyboard after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);

      // // Scroll to bottom if needed
      // _scrollToBottom();
    });

    startMinuteRebuild();
  }

  void _sendComment() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    // For demonstration, just clear the input and scroll
    _textController.clear();

    // TODO: scroll at the top
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    stopMinuteRebuild();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final relativeTime = TimeUtils.timeAgo(widget.post.createdAt);

    return CustomScaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textOnPrimary),
          onPressed: () {
            NavigationUtils.handleBackNavigation(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.post.userName,
                                style: AppTextStyles.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
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
                          Icon(
                            Icons.favorite_border,
                            color: AppColors.textDisabled,
                          ),
                          UiUtils.addHorizontalSpaceXS(),
                          Text(
                            AppStrings.like,
                            style: AppTextStyles.caption.copyWith(
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

                  UiUtils.addVerticalSpaceL(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.post.likesCount} likes',
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${widget.post.commentsCount} shares',
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  UiUtils.addVerticalSpaceL(),

                  // Comments
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CommentWidget(
                            comment: Comment(
                              userName: "John Martin",
                              userProfileImageUrl: null,
                              comment: AppStrings.placeholderParagraph,
                              likesCount: 0,
                            ),
                          ),
                          if (index != 2) UiUtils.addVerticalSpaceL(),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Fixed input at bottom
          AppTextInput(
            controller: _textController,
            focusNode: _focusNode,
            onSend: () {
              // handle sending comment
              _textController.clear();
            },
            onAttach: () {
              // handle attachment
            },
          ),
        ],
      ),
    );
  }
}
