// ignore_for_file: unreachable_switch_case

import 'package:demo_noti/api/navigation.dart';
import 'package:demo_noti/screens/authen/forgot-screen.dart';
import 'package:demo_noti/screens/authen/login-screen.dart';
import 'package:demo_noti/screens/home/home-main.dart';
import 'package:demo_noti/screens/notications/notications-main.dart';
import 'package:demo_noti/screens/product/product-main.dart';
import 'package:demo_noti/screens/profile-screen/sub-screen/setting-screen.dart';
import 'package:demo_noti/screens/transactions/transactions-main.dart';
import 'package:demo_noti/data/services/auth_service.dart';
import 'package:demo_noti/screens/profile-screen/profile-screen.dart';
import 'package:demo_noti/screens/splash-screen/splash-screen.dart';
import 'package:demo_noti/utils/fade-slide-route.dart';
import 'package:demo_noti/utils/permission_utils.dart';
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
  SettingsRoute() => '/profile/settings',
  TransactionDetailsRoute(transactionId: final id) => '/transactions/$id',
  CreateTransactionRoute() => '/transactions/create',
  ProductDetailsRoute(productId: final id) => '/products/$id',
  ChatListRoute() => '/chat',
  ChatDetailsRoute(conversationId: final id) => '/chat/$id',
  _ => throw Exception("Unknown route: $r"),
};

String? _appRedirect(
  BuildContext context,
  GoRouterState state,
  AuthService authService,
) {
  final isLoggedIn = authService.isLoggedIn;
  final location = state.matchedLocation;

  // Pages that do not require login
  final isPublicPage = location == '/login' || location == '/forgot-password';

  // If on Splash screen, allow display
  if (location == '/splash') {
    return null;
  }

  // If not logged in and trying to access a protected page
  if (!isLoggedIn && !isPublicPage) {
    return '/login';
  }

  // If logged in and accessing the login/forgot password page
  if (isLoggedIn && isPublicPage) {
    return '/home';
  }

  // In all other cases, allow navigation
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
    // Redirect logic is applied to all navigations
    // Example: If a user is not logged in and tries to access /npp-home, they will be redirected to /login.
    // If a user is logged in and is on the /login page, they will be redirected to the home page corresponding to their role.
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
        pageBuilder: (context, state) => buildPageWithFadeSlideTransition(
          context: context,
          state: state,
          child: const LoginScreen(),
        ),
        // builder: (context, state) => const LoginScreen()
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/profile/settings',
        pageBuilder: (context, state) => buildPageWithFadeSlideTransition(
          context: context,
          state: state,
          child: const SettingScreen(),
        ),
      ),
      // Main route using ShellRoute for Bottom Navigation Bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(shell: shell),
        branches: [
          // Branch 1: Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) =>
                    buildPageWithFadeSlideTransition(
                      context: context,
                      state: state,
                      child: HomeMainScreen(
                        currentUserRole:
                            authService.currentUser?.role ?? UserRole.c2,
                      ),
                    ),

                // builder: (_, __) => const PlaceholderScreen('Home'),
              ),
            ],
          ),
          // Branch 2: Transactions
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/transactions',
                pageBuilder: (context, state) =>
                    buildPageWithFadeSlideTransition(
                      context: context,
                      state: state,
                      child: TransactionsMainScreen(
                        currentUserRole:
                            authService.currentUser?.role ?? UserRole.c2,
                      ),
                    ),
                // builder: (_, __) => const PlaceholderScreen('Transactions'),
              ),
            ],
          ),
          // Branch 3: Products
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/products',
                pageBuilder: (context, state) =>
                    buildPageWithFadeSlideTransition(
                      context: context,
                      state: state,
                      child: ProductMainScreen(
                        currentUserRole:
                            authService.currentUser?.role ?? UserRole.c2,
                      ),
                    ),
                // builder: (_, s) => const PlaceholderScreen('Products'),
              ),
            ],
          ),
          // Branch 4: Notifications
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/notifications',
                pageBuilder: (context, state) =>
                    buildPageWithFadeSlideTransition(
                      context: context,
                      state: state,
                      child: NotificationsMainScreen(
                        currentUserRole:
                            authService.currentUser?.role ?? UserRole.c2,
                      ),
                    ),
              ),
            ],
          ),
          // Branch 5: Account
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                // Updated to use your ProfileScreen
                pageBuilder: (context, state) =>
                    buildPageWithFadeSlideTransition(
                      context: context,
                      state: state,
                      child: const ProfileScreen(),
                    ),
                // builder: (_, __) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // Detail routes, pushed on top of the Shell
      GoRoute(
        path: '/transactions/create',
        pageBuilder: (context, state) => buildPageWithFadeSlideTransition(
          context: context,
          state: state,
          child: const PlaceholderScreen('Create New Transaction'),
        ),
      ),
      GoRoute(
        path: '/transactions/:transactionId',
        pageBuilder: (context, state) => buildPageWithFadeSlideTransition(
          context: context,
          state: state,
          child: PlaceholderScreen(
            'Transaction Details ID: ${state.pathParameters['transactionId']}',
          ),
        ),
        // builder: (context, state) {
        //   final id = state.pathParameters['transactionId']!;
        //   return PlaceholderScreen('Transaction Details ID: $id');
        // },
      ),
      GoRoute(
        path: '/products/:productId',
        pageBuilder: (context, state) => buildPageWithFadeSlideTransition(
          context: context,
          state: state,
          child: PlaceholderScreen(
            'Product Details ID: ${state.pathParameters['productId']}',
          ),
        ),
        // builder: (context, state) {
        //   final id = state.pathParameters['productId']!;
        //   return PlaceholderScreen('Product Details ID: $id');
        // },
      ),
      GoRoute(
        path: '/chat',
        pageBuilder: (context, state) => buildPageWithFadeSlideTransition(
          context: context,
          state: state,
          child: const PlaceholderScreen('Chat List'),
        ),
      ),
      GoRoute(
        path: '/chat/:conversationId',
        pageBuilder: (context, state) => buildPageWithFadeSlideTransition(
          context: context,
          state: state,
          child: PlaceholderScreen(
            'Chat Details ID: ${state.pathParameters['conversationId']}',
          ),
        ),
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
