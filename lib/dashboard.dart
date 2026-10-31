import 'package:andreaproject/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          children: [
            Text("Dashboard"),
            ElevatedButton(
              onPressed: () {
                // GoRouter.of(context).go('/profile/renal');
                String title = "renal";
                // context.go('/profile/$title');
                //go is transisi without stacking
                context.goNamed(
                  RouteNames.profile,
                  pathParameters: {'name': title},
                );
              },
              child: Text('Go To Profile'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(
                  RouteNames.message,
                  queryParameters: {'name': 'Sabdo'},
                );
              },
              child: Text('Go To Message'),
            ),
          ],
        ),
      ),
    );
  }
}
