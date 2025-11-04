import 'package:flutter/material.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/navigation_utils.dart';
import '../widgets/post_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(AppStrings.favorites, style: AppTextStyles.appBarTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textOnPrimary),
          onPressed: () {
            NavigationUtils.handleBackNavigation(context);
          },
        ),
      ),
      backgroundColor: AppColors.background,
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return PostWidget(
            description: "Mga nalike ni Em",
            author: 'John Martin Marasigan',
            authorImageUrl: 'assets/images/jm.jpg',
            datePosted: '10/08/25',
            isLiked: true,
          );
        },
      ),
    );
  }
}
