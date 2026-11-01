import 'package:flutter/material.dart';

class ProductModel {
  final String title;
  final String rating;
  final String price;
  final Color backgroundColor;
  final String imagePath;

  ProductModel({
    required this.title,
    required this.rating,
    required this.price,
    required this.backgroundColor,
    required this.imagePath,
  });
}
