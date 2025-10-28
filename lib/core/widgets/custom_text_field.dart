import 'package:flutter/material.dart';

import '../constants/app_strings.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final bool isMultiline;
  final InputDecoration? decoration;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.isMultiline = false,
    this.decoration,
  });

  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleChange);
  }

  void _handleChange() {
    setState(() {
      _showClear = widget.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleChange);
    super.dispose();
  }

  TextInputType _getKeyboardType() {
    if (widget.hint.contains(AppStrings.email)) {
      return TextInputType.emailAddress;
    }
    if (widget.hint.contains(AppStrings.phone)) {
      return TextInputType.phone;
    }
    if (widget.hint.contains(AppStrings.password)) {
      return TextInputType.visiblePassword;
    }
    if (widget.isMultiline) return TextInputType.multiline;

    return TextInputType.text; // default
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.isMultiline ? 5 : 1,
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType ?? _getKeyboardType(),
      decoration:
          widget.decoration ??
          InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon == null
                ? null
                : Icon(widget.prefixIcon),
            suffixIcon: _showClear
                ? IconButton(
                    icon: const Icon(Icons.clear, size: 20),
                    onPressed: () {
                      widget.controller.clear();
                    },
                  )
                : null,
            border: const OutlineInputBorder(),
          ),
    );
  }
}
