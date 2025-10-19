import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pump/core/theme/app_colors.dart';
import 'package:pump/core/theme/app_text_styles.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_button_styles.dart';
import '../../../../core/utils/navigation_utils.dart';
import '../../../../core/utils/ui_utils.dart';
import '../../../../core/widgets/custom_text_field.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text(AppStrings.feedback, style: AppTextStyles.appBarTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textOnPrimary),
            onPressed: () {
              NavigationUtils.handleBackNavigation(context);
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.spaceL),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Takes only as much as available height needed
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.letMeKnowWhatToImprove,
                  style: AppTextStyles.bodyLarge,
                ),

                UiUtils.addVerticalSpaceXXL(),

                // Middle section
                Center(
                  child: CustomTextField(
                    hint: AppStrings.message,
                    controller: _messageController,
                    isMultiline: true,
                  ),
                ),

                UiUtils.addVerticalSpaceS(),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: AppButtonStyles.normal,
                    onPressed: () {},
                    child: const Text(AppStrings.submit),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
