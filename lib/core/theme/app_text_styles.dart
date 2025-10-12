import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles { // TODO: CONTINUE
  // 🧱 Base TextStyle
  static const TextStyle base = TextStyle(
    fontFamily: 'Roboto', // or your custom font
    color: AppColors.textPrimary,
  );

  // 🏷️ Headings
  static final TextStyle heading1 = base.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading2 = base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading3 = base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  // 💬 Body text
  static final TextStyle body = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyBold = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle small = base.copyWith(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static final TextStyle hint = base.copyWith(
    fontSize: 14,
    color: AppColors.textHint,
  );

  // 🔘 Buttons
  static final TextStyle button = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,// TODO
  );

  // 🧾 Captions or labels
  static final TextStyle caption = base.copyWith(
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  static final TextStyle copyright = base.copyWith(
    fontSize: 12,
    color: AppColors.textSecondary,
  );
}
