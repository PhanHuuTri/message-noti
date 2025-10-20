import 'package:demo_noti/screens/product/npp/product-npp.dart';
import 'package:demo_noti/screens/product/thucap/product-thucap.dart';
import 'package:demo_noti/utils/permission_utils.dart';
import 'package:flutter/material.dart';

class ProductMainScreen extends StatelessWidget {
  const ProductMainScreen({super.key, required this.currentUserRole});
  final UserRole currentUserRole;

  @override
  Widget build(BuildContext context) {
    switch (currentUserRole) {
      case UserRole.admin:
        // Navigate to admin dashboard
        return Scaffold(
          appBar: AppBar(title: const Text('Admin Products')),
          body: const Center(child: Text('Welcome to the Admin Products!')),
        );
      case UserRole.npp:
        // Navigate to NPP dashboard
        return const ProductNppScreen();
      case UserRole.employee:
        // Navigate to employee dashboard
        return Scaffold(
          appBar: AppBar(title: const Text('Employee Products')),
          body: const Center(child: Text('Welcome to the Employee Products!')),
        );
      case UserRole.subDealer:
        // Navigate to sub-dealer dashboard
        return Scaffold(
          appBar: AppBar(title: const Text('Sub-Dealer Products')),
          body: const Center(
            child: Text('Welcome to the Sub-Dealer Products!'),
          ),
        );
      case UserRole.c2:
        // Navigate to C2 dashboard
        return Scaffold(
          appBar: AppBar(title: const Text('C2 Products')),
          body: const Center(child: Text('Welcome to the C2 Products!')),
        );
      case UserRole.thuCap:
        // Navigate to C2 dashboard
        return const ThucapProductScreen();
      case UserRole.nhanVien:
        // Navigate to nhân viên dashboard
        return Scaffold(
          appBar: AppBar(title: const Text('Nhân viên Products')),
          body: const Center(child: Text('Welcome to the Nhân viên Products!')),
        );
    }
  }
}
