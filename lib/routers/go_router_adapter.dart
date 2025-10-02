// ignore_for_file: unreachable_switch_case

import 'package:demo_noti/api/navigation.dart';
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
  HomeRoute() => '/home',
  SearchRoute() => '/search',
  CartRoute() => '/cart',
  ProfileRoute() => '/profile',
  _ => '/home',
};

GoRouter buildGoRouter({
  required List<RouteBase> extraRoutes,
  String initialLocation = '/home',
  String? Function(BuildContext, GoRouterState)? redirect,
  List<NavigatorObserver> observers = const [],
}) {
  return GoRouter(
    initialLocation: initialLocation,
    observers: observers,
    redirect: redirect,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/home', builder: (_, __) => const _Stub('Home')),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                builder: (_, __) => const _Stub('Search'),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/cart', builder: (_, s) => const _Stub('Cart')),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (_, __) => const _Stub('Profile'),
              ),
            ],
          ),
        ],
      ),
      // đăng ký thêm từ feature modules (product, settings, …)
      ...extraRoutes,
    ],
  );
}

final class _Stub extends StatelessWidget {
  const _Stub(this.title);
  final String title;
  @override
  Widget build(BuildContext c) => Center(child: Text(title));
}
