import 'package:andreaproject/core/themes/app_theme.dart';
import 'package:andreaproject/features/auth/presentation/onboarding_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: OnboardingPage(),
    );
  }
}
