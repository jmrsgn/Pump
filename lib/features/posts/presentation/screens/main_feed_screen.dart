import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/routes.dart';
import 'package:pump/core/utils/navigation_utils.dart';
import 'package:pump/core/widgets/app_drawer.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';
import 'package:pump/features/posts/presentation/widgets/post_widget.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/domain/entities/user.dart';
import '../../../../core/theme/app_colors.dart';

class MainFeedScreen extends ConsumerStatefulWidget {
  const MainFeedScreen({super.key});

  @override
  ConsumerState<MainFeedScreen> createState() => _MainFeedScreenState();
}

class _MainFeedScreenState extends ConsumerState<MainFeedScreen> {
  void signOut() async {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    // final postState = ref.watch(authViewModelProvider);
    // final authViewModel = ref.watch(authViewModelProvider.notifier);
    final user = User(
      firstName: "John Martin",
      lastName: "Marasigan",
      email: "marasiganjohnmartin@gmail.com",
      phone: "+639561723007",
      role: 1,
      profileImageUrl: null,
    );

    return CustomScaffold(
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
      drawer: AppDrawer(
        currentUser: user,
        onSignOut: signOut,
        selectedRoute: '',
      ),
      body: ListView.builder(
        itemCount: 3,
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
