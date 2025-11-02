import 'package:flutter/material.dart';
import 'package:pump/core/constants/app_dimens.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';
import 'package:pump/core/widgets/custom_text_field.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/navigation_utils.dart';
import '../../../../core/utils/ui_utils.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _postDescriptionController = TextEditingController();

    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textOnPrimary),
          onPressed: () => NavigationUtils.handleBackNavigation(context),
        ),
        title: Row(
          children: [
            Text(AppStrings.createPost, style: AppTextStyles.heading3),
          ],
        ),
        actions: [IconButton(icon: const Icon(Icons.send), onPressed: () {})],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.all(AppDimens.pagePadding),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(),
                  UiUtils.addHorizontalSpaceS(),
                  Text(
                    'John Martin Marasigan',
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              UiUtils.addVerticalSpaceM(),
              TextField(
                controller: _postDescriptionController,
                maxLines: 15,
                decoration: const InputDecoration(
                  hintText: AppStrings.whatsOnYourMind,
                  border: InputBorder.none, // removes default border
                  enabledBorder:
                      InputBorder.none, // removes border when enabled
                  focusedBorder:
                      InputBorder.none, // removes border when focused
                  errorBorder: InputBorder.none, // removes border when error
                  disabledBorder:
                      InputBorder.none, // removes border when disabled
                  contentPadding:
                      EdgeInsets.zero, // optional: removes padding around text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
