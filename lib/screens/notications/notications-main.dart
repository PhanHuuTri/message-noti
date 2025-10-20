import 'package:demo_noti/utils/permission_utils.dart';
import 'package:flutter/material.dart';

class NotificationsMainScreen extends StatelessWidget {
  const NotificationsMainScreen({super.key, required this.currentUserRole});
  final UserRole currentUserRole;

  @override
  Widget build(BuildContext context) {
    switch (currentUserRole) {
      case UserRole.admin:
        // Navigate to admin notifications
        return Scaffold(
          appBar: AppBar(title: const Text('Admin Notifications')),
          body: const Center(
            child: Text('Welcome to the Admin Notifications!'),
          ),
        );
      case UserRole.npp:
        // Navigate to NPP notifications
        return Scaffold(
          appBar: AppBar(title: const Text('NPP Notifications')),
          body: const Center(child: Text('Welcome to the NPP Notifications!')),
        );
      case UserRole.employee:
        // Navigate to employee notifications
        return Scaffold(
          appBar: AppBar(title: const Text('Employee Notifications')),
          body: const Center(
            child: Text('Welcome to the Employee Notifications!'),
          ),
        );
      case UserRole.subDealer:
        // Navigate to sub-dealer notifications
        return Scaffold(
          appBar: AppBar(title: const Text('Sub-Dealer Notifications')),
          body: const Center(
            child: Text('Welcome to the Sub-Dealer Notifications!'),
          ),
        );
      case UserRole.c2:
        // Navigate to C2 notifications
        return Scaffold(
          appBar: AppBar(title: const Text('C2 Notifications')),
          body: const Center(child: Text('Welcome to the C2 Notifications!')),
        );
      case UserRole.thuCap:
        // Navigate to C2 notifications
        return Scaffold(
          appBar: AppBar(title: const Text('Đại lý cấp 2 Notifications')),
          body: const Center(
            child: Text('Welcome to the Đại lý cấp 2 Notifications!'),
          ),
        );
      case UserRole.nhanVien:
        // Navigate to C2 notifications
        return Scaffold(
          appBar: AppBar(title: const Text('Nhân viên Notifications')),
          body: const Center(
            child: Text('Welcome to the Nhân viên Notifications!'),
          ),
        );
    }
  }
}
