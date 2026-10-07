import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/auth/sign_in_screen.dart';
import '../../screens/auth/sign_up_screen.dart';
import '../../widgets/bottom_navigation_shell.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/leaderboard/leaderboard_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/quiz/quiz_screen.dart';
import '../../screens/quiz/result_screen.dart';

class AppRoutes {
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String home = '/home';
  static const String leaderboard = '/leaderboard';
  static const String profile = '/profile';
  static const String quiz = '/quiz';
  static const String result = '/result';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.signIn,
    routes: [
      GoRoute(
        path: AppRoutes.signIn,
        name: 'sign-in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        name: 'sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.quiz,
        name: 'quiz',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const QuizScreen(),
      ),
      GoRoute(
        path: AppRoutes.result,
        name: 'result',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ResultScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavigationShell(navigationShell: navigationShell);
        },
        branches: [
          //home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          //leaderboard
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.leaderboard,
                name: 'leaderboard',
                builder: (context, state) => const LeaderboardScreen(),
              ),
            ],
          ),
          //profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
