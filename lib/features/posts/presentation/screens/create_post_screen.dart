import 'package:flutter/material.dart';

import '../../../../core/constants/app/app_dimens.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/domain/entities/user.dart';
import '../../../../core/presentation/theme/app_colors.dart';
import '../../../../core/presentation/theme/app_text_styles.dart';
import '../../../../core/presentation/widgets/custom_scaffold.dart';
import '../../../../core/utils/navigation_utils.dart';
import '../../../../core/utils/ui_utils.dart';

class CreatePostScreen extends StatelessWidget {
  final User currentUser;

  const CreatePostScreen({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();

    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textOnPrimary),
          onPressed: () => NavigationUtils.handleBackNavigation(context),
        ),
        title: Text(AppStrings.createPost, style: AppTextStyles.heading3),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Handle post submission here
              // TODO:
              final title = _titleController.text.trim();
              final description = _descriptionController.text.trim();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.all(AppDimens.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User info row
              Row(
                children: [
                  currentUser.profileImageUrl == null
                      ? CircleAvatar(
                          backgroundColor: AppColors.primary,
                          radius: AppDimens.radiusL,
                          child: Text(
                            currentUser.firstName[0],
                            style: AppTextStyles.body.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage: AssetImage(
                            currentUser.profileImageUrl!,
                          ),
                          radius: AppDimens.radiusL,
                        ),
                  UiUtils.addHorizontalSpaceS(),
                  Text(
                    '${currentUser.firstName} ${currentUser.lastName}',
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              UiUtils.addVerticalSpaceM(),

              // Title TextField
              TextField(
                controller: _titleController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: AppStrings.whatsOnYourMind,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
                style: AppTextStyles.heading3,
              ),

              UiUtils.addVerticalSpaceS(),

              // Description TextField
              Expanded(
                child: TextField(
                  controller: _descriptionController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: AppTextStyles.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
