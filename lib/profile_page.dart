import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile PAge')),
      body: Center(child: Text('On Profile Page')),
      backgroundColor: Colors.blue,
    );
  }
}
