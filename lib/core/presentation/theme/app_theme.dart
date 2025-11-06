import 'package:flutter/material.dart';

import 'input_decoration_theme.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: AppInputDecorations.defaultTheme,
    );
  }
}
