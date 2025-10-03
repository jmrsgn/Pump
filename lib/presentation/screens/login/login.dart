import 'package:flutter/material.dart';
import 'package:pump/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen'),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Username",
              controller: usernameController,
              prefixIcon: Icons.person,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Password",
              controller: passwordController,
              prefixIcon: Icons.lock,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/home');
                debugPrint("Hello World");
              },
              child: const Text('Go to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
