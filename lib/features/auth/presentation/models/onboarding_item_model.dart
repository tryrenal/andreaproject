import 'package:flutter/material.dart';

class OnboardingItemModel {
  final String title;
  final String description;
  final String imagePath;
  final Color backgroundColor;
  final IconData icon;

  OnboardingItemModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backgroundColor,
    required this.icon,
  });
}
