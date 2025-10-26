import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pump/core/constants/app_strings.dart';
import 'package:pump/core/routes.dart';
import 'package:pump/core/theme/app_theme.dart';
import 'package:pump/features/auth/data/repository/auth_repository_impl.dart';
import 'package:pump/features/auth/data/services/auth_service.dart';
import 'package:pump/features/auth/domain/usecases/login_usecase.dart';
import 'package:pump/features/auth/presentation/viewmodels/auth_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) =>
          AuthViewModel(LoginUseCase(AuthRepositoryImpl(AuthService()))),
      // Provider wraps MaterialApp directly
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
