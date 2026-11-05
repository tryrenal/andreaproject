import 'package:andreaproject/app_routers.dart';
import 'package:andreaproject/features/auth/presentation/onboarding_page.dart';
import 'package:andreaproject/features/home/presentation/home_page.dart';
import 'package:andreaproject/features/home/presentation/spending_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRouters.onBoarding,
  routes: [
    GoRoute(
      path: AppRouters.onBoarding,
      builder: (context, state) => OnboardingPage(),
    ),
    GoRoute(path: AppRouters.home, builder: (context, state) => HomePage()),
    GoRoute(
      path: AppRouters.spending,
      builder: (context, state) => SpendingPage(),
    ),
  ],
);
