import 'package:andreaproject/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Center(
        child: Column(
          children: [
            Text('Login'),
            ElevatedButton(
              onPressed: () {
                context.goNamed(RouteNames.dashboard);
              },
              child: Text('Go To Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
