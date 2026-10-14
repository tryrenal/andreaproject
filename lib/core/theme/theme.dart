import 'package:andreaproject/core/theme/app_pallate.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border([Color color = AppPallete.borderColor]) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 3),
        borderRadius: BorderRadius.circular(10),
      );

  static final dartThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
    ),
  );
}
