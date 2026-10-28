import 'package:andreaproject/feed_page.dart';
import 'package:andreaproject/home_page.dart';
import 'package:andreaproject/persistent_bottom_nav.dart';
import 'package:andreaproject/profile_page.dart';
import 'package:andreaproject/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PersistentBottomNav());
  }
}
