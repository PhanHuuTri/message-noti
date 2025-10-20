import 'package:flutter/material.dart';

enum UserRole {
  admin,
  npp,
  employee,
  subDealer,
  c2,
  thuCap,
  nhanVien,
}

class PermissionUtils {
  static final Map<String, List<UserRole>> _screenPermissions = {
    // Common screens
    'profile': [UserRole.admin, UserRole.npp, UserRole.employee, UserRole.subDealer, UserRole.c2],
    'settings': [UserRole.admin, UserRole.npp, UserRole.employee, UserRole.subDealer, UserRole.c2],

    // Admin screens
    'admin_dashboard': [UserRole.admin],

    // NPP screens
    'npp_dashboard': [UserRole.npp],

    // Employee screens
    'employee_dashboard': [UserRole.employee],

    // Sub-dealer screens
    'sub_dealer_dashboard': [UserRole.subDealer],

    // C2 screens
    'c2_dashboard': [UserRole.c2],
  };

  static bool isScreenAllowed(String screenName, UserRole userRole) {
    final allowedRoles = _screenPermissions[screenName];
    return allowedRoles?.contains(userRole) ?? false;
  }

  static void navigateToScreen(BuildContext context, String screenName, UserRole userRole) {
    if (isScreenAllowed(screenName, userRole)) {
      Navigator.pushNamed(context, '/$screenName');
    } else {
      // Show an error message or navigate to an "access denied" screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You do not have permission to access this screen.')),
      );
    }
  }
}
