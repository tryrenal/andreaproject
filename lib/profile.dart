import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  final String title;

  const Profile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: Text('Go To Dashboard'),
            ),
            Text("profile - $title"),
          ],
        ),
      ),
    );
  }
}
