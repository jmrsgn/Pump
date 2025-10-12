import 'package:flutter/material.dart';
import 'package:pump/core/constants/strings.dart';
import 'package:pump/core/routes.dart';
import 'package:pump/core/widgets/app_drawer.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';
import 'package:pump/features/posts/presentation/widgets/post_widget.dart';
import '../../../../core/theme/app_colors.dart';

class MainFeedScreen extends StatefulWidget {
  const MainFeedScreen({super.key});

  State<StatefulWidget> createState() => _MainFeedScreen();
}

class _MainFeedScreen extends State<MainFeedScreen> {
  bool _isLoading = false;

  void signOut() async {
    // setState(() {
    //   _isLoading = true;
    // });
    //
    // await Future.delayed(const Duration(seconds: 2));
    //
    // setState(() {
    //   _isLoading = false;
    // });
    //
    // // Wait a short frame so UI updates before navigating
    // await Future.delayed(Duration(milliseconds: 100));

    Navigator.pushReplacementNamed(context, AppRoutes.login);
    // if (mounted) {
    // }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isLoading: _isLoading,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      drawer: AppDrawer(onSignOut: signOut, selectedRoute: ''),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return PostWidget(
            description: AppStrings.placeholderParagraph,
            author: 'JM injured',
            authorImageUrl: '',
            datePosted: '10/08/25',
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO:
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
