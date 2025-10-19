import 'package:flutter/material.dart';
import 'package:pump/core/constants/app_dimens.dart';
import 'package:pump/core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';

class PostWidget extends StatelessWidget {
  final String description;
  final String author;
  final String authorImageUrl;
  final String datePosted;
  final String? postImageUrl;

  const PostWidget({
    super.key,
    required this.description,
    required this.author,
    required this.authorImageUrl,
    required this.datePosted,
    this.postImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      margin: EdgeInsets.only(bottom: AppDimens.dimen4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.dimen8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header user info
            Container(
              padding: const EdgeInsets.all(AppDimens.dimen4),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: AppDimens.dimen20,
                    backgroundColor: AppColors.primary,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ), // TODO fix color
                  ),
                  SizedBox(width: AppDimens.dimen10),
                  Expanded(child: Text(author, style: AppTextStyles.heading3)),
                  Text(datePosted, style: AppTextStyles.bodySmall),
                ],
              ),
            ),
            const SizedBox(height: AppDimens.dimen10),

            // Post description
            Container(
              padding: const EdgeInsets.all(AppDimens.dimen4),
              child: Text(
                description,
                style: AppTextStyles.body,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10),

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
            const SizedBox(height: 10),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.favorite_border,
                  color: AppColors.textPrimary,
                ), // TODO: add color for icons
                Icon(Icons.comment_outlined, color: AppColors.textPrimary),
                Icon(Icons.share, color: AppColors.textPrimary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
