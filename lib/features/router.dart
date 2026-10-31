import 'package:andreaproject/features/app_routers.dart';
import 'package:andreaproject/features/auth/presentation/pages/onboarding_page.dart';
import 'package:andreaproject/features/home/presentation/cart/cart_page.dart';
import 'package:andreaproject/features/home/presentation/feed/feed_page.dart';
import 'package:andreaproject/features/home/presentation/home_page.dart';
import 'package:andreaproject/features/home/presentation/message/message_page.dart';
import 'package:andreaproject/features/home/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _feedNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _messageNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _cartNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _profileNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: AppRouters.onBoarding,
  routes: [
    GoRoute(
      path: AppRouters.onBoarding,
      builder: (context, state) => OnboardingPage(),
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigatorShell) {
        return HomePage(navigationShell: navigatorShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _feedNavigatorKey,
          routes: [
            GoRoute(
              path: AppRouters.feed,
              builder: (context, state) => FeedPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _messageNavigatorKey,
          routes: [
            GoRoute(
              path: AppRouters.message,
              builder: (context, state) => MessagePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _cartNavigatorKey,
          routes: [
            GoRoute(
              path: AppRouters.cart,
              builder: (context, state) => CartPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: AppRouters.profile,
              builder: (context, state) => ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
