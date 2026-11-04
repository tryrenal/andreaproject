import 'package:andreaproject/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColor.blackBackground,
    appBarTheme: AppBarTheme(backgroundColor: AppColor.transparant),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.lightBackground,
    appBarTheme: AppBarTheme(backgroundColor: AppColor.transparant),
  );
}
