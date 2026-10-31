import 'package:andreaproject/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Message extends StatelessWidget {
  final String name;
  const Message({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Message ')),
      body: Center(
        child: Column(
          children: [
            Text('message page - $name'),
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
