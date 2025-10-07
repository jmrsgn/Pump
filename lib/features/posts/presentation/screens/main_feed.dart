import 'package:flutter/material.dart';
import 'package:pump/core/constants/dimens.dart';
import 'package:pump/core/routes.dart';
import 'package:pump/core/theme/app_colors.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

import '../../../../core/theme/app_text_styles.dart';

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
      backgroundColor: AppColors.backgroundDark,
      drawer: _MainFeedDrawer(onSignOut: signOut),
      body: const Center(
        // TODO: Add feed
      ),
    );
  }
}

class _MainFeedDrawer extends StatelessWidget {
  final VoidCallback onSignOut;

  const _MainFeedDrawer({required this.onSignOut});

  void signOut() {
    // TODO: actual sign-out logic (Firebase/Auth/JWT clearing, etc.)
    onSignOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundDark,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.symmetric(horizontal: PaddingDimens.padding20),
            decoration: const BoxDecoration(color: AppColors.backgroundDark),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: IconDimens.iconSizeLarge,
                  color: AppColors.white,
                ),
                const SizedBox(width: MarginDimens.margin30),
                Expanded(
                  child: Container(
                    color: AppColors.backgroundDark,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('John', style: AppTextStyles.heading1),
                        Text(
                          'marasiganjohnmartin@gmail.com',
                          style: AppTextStyles.small,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Sign out'),
            onTap: () {
              signOut();
            },
          ),
        ],
      ),
    );
  }
}
