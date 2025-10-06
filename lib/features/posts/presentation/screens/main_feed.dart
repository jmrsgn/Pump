import 'package:flutter/material.dart';
import 'package:pump/core/widgets/custom_scaffold.dart';

class MainFeedScreen extends StatelessWidget {
  const MainFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: const Center(
        child: Text("Welcome to Main Feed Screen!", style: TextStyle(fontSize: 36)),
      ),
    );
  }
}
