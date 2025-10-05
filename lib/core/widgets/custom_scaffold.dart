import 'package:flutter/material.dart';
import 'package:pump/core/constants/dimens.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showBackButton;
  final Color? backgroundColor;
  final AppBar? appBar;

  const CustomScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.floatingActionButton,
    this.showBackButton = false,
    this.backgroundColor,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: appBar,
      body: SafeArea(child: body),
      floatingActionButton: floatingActionButton,
    );
  }
}
