import 'package:go_router/go_router.dart';

/// Represents a named route with type-safe parameters
sealed class RouteSpec {
  const RouteSpec();
}

class HomeRoute extends RouteSpec { const HomeRoute(); }
class SearchRoute extends RouteSpec { const SearchRoute(); }
class CartRoute extends RouteSpec { const CartRoute(); }
class ProfileRoute extends RouteSpec { const ProfileRoute(); }

// Navigation result (if the screen returns)
typedef NavResult<T> = Future<T?>;

abstract interface class Navigation {
  // go = replace stack by location
  void go(RouteSpec route);
  // push = push on top
  NavResult<T> push<T>(RouteSpec route);
  bool canPop();
  void pop<T extends Object?>([T? result]);
}

// Allow features to register routes independently of a specific adapter
typedef RouteBuilder = RouteBase Function();
abstract interface class RouteRegistry {
  void register(List<RouteBase> routes); // RouteBase is an "abstract concept" – adapter can map as needed
}