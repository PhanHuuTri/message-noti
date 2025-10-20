import 'package:demo_noti/screens/transactions/npp/npp-screen.dart';
import 'package:demo_noti/screens/transactions/thucap-c2/transactions-thucap.dart';
import 'package:demo_noti/utils/permission_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionsMainScreen extends StatelessWidget {
  const TransactionsMainScreen({super.key, required this.currentUserRole});
  final UserRole currentUserRole;

  @override
  Widget build(BuildContext context) {
    switch (currentUserRole) {
      case UserRole.admin:
        // Navigate to admin transactions
        return Scaffold(
          appBar: AppBar(title: const Text('Admin Transactions')),
          body: const Center(child: Text('Welcome to the Admin Transactions!')),
        );
      case UserRole.npp:
        // Navigate to NPP transactions
        return NppScreen();
      case UserRole.employee:
        // Navigate to employee transactions
        return Scaffold(
          appBar: AppBar(title: const Text('Employee Transactions')),
          body: const Center(
            child: Text('Welcome to the Employee Transactions!'),
          ),
        );
      case UserRole.subDealer:
        // Navigate to sub-dealer transactions
        return Scaffold(
          appBar: AppBar(title: const Text('Sub-Dealer Transactions')),
          body: const Center(
            child: Text('Welcome to the Sub-Dealer Transactions!'),
          ),
        );
      case UserRole.c2:
        // Navigate to C2 transactions
        return TransactionsThuCapScreen();
      case UserRole.thuCap:
        // Navigate to C2 transactions
        return TransactionsThuCapScreen();
      case UserRole.nhanVien:
        // Navigate to C2 transactions
        return Scaffold(
          appBar: AppBar(title: const Text('Nhân viên Transactions')),
          body: const Center(
            child: Text('Welcome to the Nhân viên Transactions!'),
          ),
        );
    }
  }
}
