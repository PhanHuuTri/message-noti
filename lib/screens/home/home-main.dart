import 'package:demo_noti/screens/home/c2/c2-home.dart';
import 'package:demo_noti/screens/home/npp/cpp-screen.dart';
import 'package:demo_noti/utils/permission_utils.dart';
import 'package:flutter/material.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key, required this.currentUserRole});
  final UserRole currentUserRole;
  @override
  Widget build(BuildContext context) {
    switch (currentUserRole) {
      case UserRole.admin:
        // Navigate to admin dashboard
        return Scaffold(
          appBar: AppBar(title: const Text('Admin Dashboard')),
          body: const Center(child: Text('Welcome to the Admin Dashboard!')),
        );
      case UserRole.npp:
        // Navigate to NPP dashboard
        return const CppScreen();
      case UserRole.employee:
        // Navigate to employee dashboard
        return Scaffold(
          appBar: AppBar(title: const Text('Employee Dashboard')),
          body: const Center(child: Text('Welcome to the Employee Dashboard!')),
        );
      case UserRole.subDealer:
        // Navigate to sub-dealer dashboard
        return Scaffold(
          appBar: AppBar(title: const Text('Sub-Dealer Dashboard')),
          body: const Center(
            child: Text('Welcome to the Sub-Dealer Dashboard!'),
          ),
        );
      case UserRole.c2:
        // Navigate to C2 dashboard
        return const C2HomeView();
      case UserRole.thuCap:
        // Navigate to C2 dashboard
        return const C2HomeView();
      case UserRole.nhanVien:
        // Navigate to C2 dashboard
        return Scaffold(
          appBar: AppBar(title: const Text('Employee Dashboard')),
          body: const Center(
            child: Text('Welcome to the Employee Dashboard!'),
          ),
        );
    }
  }
}
