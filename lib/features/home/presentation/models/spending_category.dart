import 'package:flutter/material.dart';

class SpendingCategory {
  final String name;
  final double amount;
  final Color color;
  final IconData icon;

  SpendingCategory({
    required this.name,
    required this.amount,
    required this.color,
    required this.icon,
  });
}
