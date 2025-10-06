import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showBackButton;
  final Color? backgroundColor;
  final AppBar? appBar;
  final bool isLoading;

  const CustomScaffold({
    super.key,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.showBackButton = false,
    this.backgroundColor,
    this.appBar,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: appBar,
      body: Stack(
        children: [
          SafeArea(child: body),

          // Loading overlay
          if (isLoading)
            Container(
              color: AppColors.overlay,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            ),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
