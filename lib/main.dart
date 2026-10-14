import 'package:andreaproject/core/theme/theme.dart';
import 'package:andreaproject/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dartThemeMode,
      home: LoginPage(),
    );
  }
}
