import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/presentation/providers/user_providers.dart';
import 'package:pump/core/routes.dart';
import 'package:pump/core/utils/navigation_utils.dart';
import 'package:pump/features/posts/presentation/widgets/post_widget.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/presentation/theme/app_colors.dart';
import '../../../../core/presentation/widgets/app_drawer.dart';
import '../../../../core/presentation/widgets/custom_scaffold.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

class MainFeedScreen extends ConsumerStatefulWidget {
  const MainFeedScreen({super.key});

  @override
  ConsumerState<MainFeedScreen> createState() => _MainFeedScreenState();
}

class _MainFeedScreenState extends ConsumerState<MainFeedScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(userViewModelProvider.notifier).initializeCurrentUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider.notifier);
    final userState = ref.watch(userViewModelProvider);

    return CustomScaffold(
      isLoading: userState.isLoading,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.message), onPressed: () {}),
        ],
      ),
      backgroundColor: AppColors.background,
      drawer: userState.user == null
          ? const SizedBox.shrink()
          : AppDrawer(
              currentUser: userState.user!,
              onSignOut: () async {
                await authViewModel.logout();
                if (context.mounted) {
                  NavigationUtils.replaceWith(context, AppRoutes.login);
                }
              },
              selectedRoute: AppRoutes.mainFeed,
            ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return PostWidget(
            description: AppStrings.placeholderParagraph2,
            author: 'John Martin Marasigan',
            authorImageUrl: 'assets/images/jm.jpg',
            datePosted: '10/08/25',
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationUtils.navigateTo(context, AppRoutes.createPost);
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
