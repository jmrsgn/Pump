import 'package:flutter/material.dart';
import 'package:pump/core/routes.dart';
import 'package:pump/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pump',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
