import 'package:andreaproject/dashboard.dart';
import 'package:andreaproject/error_page.dart';
import 'package:andreaproject/login.dart';
import 'package:andreaproject/message.dart';
import 'package:andreaproject/profile.dart';
import 'package:andreaproject/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

bool isLoggedIn = false;

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
    errorBuilder: (contxt, state) => ErrorPage(),
    redirect: (context, state) {
      final isOnLoginPage = state.matchedLocation == '/';

      if (!isLoggedIn && !isOnLoginPage) {
        return '/';
      }

      return null;
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
