import 'package:flutter/material.dart';
import '../../core/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    required InputDecoration decoration,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        contentPadding: const EdgeInsets.symmetric(
          vertical: TextFieldDimens.paddingVertical,
          horizontal: TextFieldDimens.paddingHorizontal,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
