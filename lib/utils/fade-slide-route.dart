import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Builds a page with a horizontal slide transition.
/// - On push: the new page slides from right to left.
/// - On pop: the old page slides from left to right.
CustomTransitionPage<T> buildPageWithFadeSlideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Horizontal slide animation
      final slideAnimation = SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0), // Starts completely from the right
          end: Offset.zero, // Ends at the center of the screen
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic, // Smooth curve for the push animation
          reverseCurve: Curves.easeInCubic, // Curve for the pop animation
        )),
        child: child,
      );

      // Return the slide animation.
      // When the animation runs in reverse (pop), it automatically slides from Offset.zero back to Offset(1.0, 0.0)
      return slideAnimation;
    },
  );
}