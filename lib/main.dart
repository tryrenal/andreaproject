import 'package:andreaproject/dashboard.dart';
import 'package:andreaproject/login.dart';
import 'package:andreaproject/message.dart';
import 'package:andreaproject/profile.dart';
import 'package:andreaproject/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

final isLoggedIn = true;

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
    redirect: (context, state) {
      if (isLoggedIn) {
        return '/dashboard';
      } else {
        return '/';
      }
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Login(),
        name: RouteNames.login,
      ),
      GoRoute(
        name: RouteNames.dashboard,
        path: "/dashboard",
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
