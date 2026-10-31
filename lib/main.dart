import 'package:andreaproject/dashboard.dart';
import 'package:andreaproject/message.dart';
import 'package:andreaproject/profile.dart';
import 'package:andreaproject/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: RouteNames.dashboard,
        path: "/",
        builder: ((context, state) => Dashboard()),
        //use child/sub routes
        // routes: [
        //   GoRoute(
        //     path: "profile/:name",
        //     builder: ((context, state) => Profile(name:state.params["name"]!)),
        //   ),
        // ],
      ),
      GoRoute(
        name: RouteNames.profile,
        path: "/profile/:name",
        builder: ((context, state) =>
            Profile(title: state.pathParameters["name"]!)),
      ),

      GoRoute(
        name: RouteNames.message,
        path: '/message',
        builder: (context, state) =>
            Message(name: state.uri.queryParameters['name'] ?? ""),
      ),
    ],
  );
}
