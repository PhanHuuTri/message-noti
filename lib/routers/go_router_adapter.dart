// ignore_for_file: unreachable_switch_case

import 'package:demo_noti/api/navigation.dart';
import 'package:demo_noti/screens/authen/forgot-screen.dart';
import 'package:demo_noti/screens/authen/login-screen.dart';
import 'package:demo_noti/services/auth_service.dart';
import 'package:demo_noti/screens/profile-screen/profile-screen.dart';
import 'package:demo_noti/screens/splash-screen/splash-screen.dart';
import 'package:demo_noti/widgets/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoNav implements Navigation {
  GoNav(this._router);
  final GoRouter _router;

  @override
  void go(RouteSpec r) => _router.go(_toPath(r));
  @override
  NavResult<T> push<T>(RouteSpec r) => _router.push<T>(_toPath(r));
  @override
  bool canPop() => _router.canPop();
  @override
  void pop<T extends Object?>([T? res]) => _router.pop(res);
}

String _toPath(RouteSpec r) => switch (r) {
 SplashRoute() => '/',
      LoginRoute() => '/login',
      ForgotPasswordRoute() => '/forgot-password',
      HomeRoute() => '/home',
      TransactionsRoute() => '/transactions',
      ProductsRoute() => '/products',
      NotificationsRoute() => '/notifications',
      ProfileRoute() => '/profile',
      TransactionDetailsRoute(transactionId: final id) => '/transactions/$id',
      CreateTransactionRoute() => '/transactions/create',
      ProductDetailsRoute(productId: final id) => '/products/$id',
      ChatListRoute() => '/chat',
      ChatDetailsRoute(conversationId: final id) => '/chat/$id',
      _ => throw Exception("Unknown route: $r"),
};

String? _appRedirect(BuildContext context, GoRouterState state, AuthService authService) {
  final isLoggedIn = authService.isLoggedIn;
  final location = state.matchedLocation;

  // Các trang không cần đăng nhập
  final isPublicPage = location == '/login' || location == '/forgot-password';
  
  // Nếu đang ở màn hình Splash, cho phép hiển thị
  if (location == '/') {
    return null;
  }

  // Nếu chưa đăng nhập và đang cố vào trang cần bảo vệ
  if (!isLoggedIn && !isPublicPage) {
    return '/login';
  }

  // Nếu đã đăng nhập và đang vào trang login/forgot password
  if (isLoggedIn && isPublicPage) {
    return '/home';
  }
  
  // Các trường hợp còn lại, cho phép điều hướng
  return null;
}

GoRouter buildGoRouter({
  required AuthService authService,
  required List<RouteBase> extraRoutes,
  String initialLocation = '/',
  String? Function(BuildContext, GoRouterState)? redirect,
  List<NavigatorObserver> observers = const [],
}) {
  return GoRouter(
    initialLocation: initialLocation,
    observers: observers,
    refreshListenable: authService,
    // Logic redirect được áp dụng cho mọi điều hướng
    redirect: (context, state) => _appRedirect(context, state, authService),
    routes: [
      // Routes that are not in the Shell (e.g., Splash, Login)
      GoRoute(
        path: '/',
        // Updated to use your SplashScreen
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(), // TODO: Replace with actual LoginScreen
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(), // TODO: Replace with actual ForgotPasswordScreen
      ),

      // Main route using ShellRoute for Bottom Navigation Bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(shell: shell), // TODO: Replace with actual AppShell UI
        branches: [
          // Branch 1: Home
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/home', builder: (_, __) => const PlaceholderScreen('Home')),
            ],
          ),
          // Branch 2: Transactions
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/transactions', builder: (_, __) => const PlaceholderScreen('Transactions')),
            ],
          ),
          // Branch 3: Products
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/products', builder: (_, s) => const PlaceholderScreen('Products')),
            ],
          ),
          // Branch 4: Notifications
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/notifications', builder: (_, __) => const PlaceholderScreen('Notifications')),
            ],
          ),
          // Branch 5: Account
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                // Updated to use your ProfileScreen
                builder: (_, __) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // Detail routes, pushed on top of the Shell
      GoRoute(
        path: '/transactions/create',
        builder: (context, state) => const PlaceholderScreen('Create New Transaction'),
      ),
      GoRoute(
        path: '/transactions/:transactionId',
        builder: (context, state) {
          final id = state.pathParameters['transactionId']!;
          return PlaceholderScreen('Transaction Details ID: $id');
        },
      ),
      GoRoute(
        path: '/products/:productId',
        builder: (context, state) {
          final id = state.pathParameters['productId']!;
          return PlaceholderScreen('Product Details ID: $id');
        },
      ),
      GoRoute(
        path: '/chat',
        builder: (context, state) => const PlaceholderScreen('Chat List'),
      ),
      GoRoute(
        path: '/chat/:conversationId',
        builder: (context, state) {
          final id = state.pathParameters['conversationId']!;
          return PlaceholderScreen('Chat Details ID: $id');
        },
      ),

      // Register additional routes from other feature modules
      ...extraRoutes,
    ],
  );
}

/// Placeholder widget for screens that have not been created yet
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('This is the screen: $title')),
    );
  }
}