import 'package:go_router/go_router.dart';

/// Represents a named route with type-safe parameters
sealed class RouteSpec {
  const RouteSpec();
}
sealed class AppRouteSpec extends RouteSpec {
  const AppRouteSpec();
}

// Group screen auth & common
class SplashRoute extends AppRouteSpec { const SplashRoute(); }
class LoginRoute extends AppRouteSpec { const LoginRoute(); }
class ForgotPasswordRoute extends AppRouteSpec { const ForgotPasswordRoute(); }

// Main application routes
class HomeRoute extends AppRouteSpec { const HomeRoute(); }
class TransactionsRoute extends AppRouteSpec { const TransactionsRoute(); }
class ProductsRoute extends AppRouteSpec { const ProductsRoute(); }
class NotificationsRoute extends AppRouteSpec { const NotificationsRoute(); }
class ProfileRoute extends AppRouteSpec { const ProfileRoute(); }


/// Route for the settings screen under profile.
class SettingsRoute extends AppRouteSpec {
  const SettingsRoute();
}
class TransactionDetailsRoute extends AppRouteSpec {
  final String transactionId;
  const TransactionDetailsRoute(this.transactionId);
}

/// Route for creating a new transaction.
class CreateTransactionRoute extends AppRouteSpec {
  const CreateTransactionRoute();
}

/// Route to view the details of a product in the catalog.
class ProductDetailsRoute extends AppRouteSpec {
  final String productId;
  const ProductDetailsRoute(this.productId);
}

/// Route to the chat list screen.
class ChatListRoute extends AppRouteSpec {
  const ChatListRoute();
}

/// Route to a specific chat conversation.
class ChatDetailsRoute extends AppRouteSpec {
  final String conversationId;
  const ChatDetailsRoute(this.conversationId);
}
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