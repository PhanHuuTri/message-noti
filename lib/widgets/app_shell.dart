import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.shell});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: shell.goBranch,
        backgroundColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.swap_horiz,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'Transactions',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.inventory_2,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.notifications_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            selectedIcon: Icon(
              Icons.notifications,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
            selectedIcon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
