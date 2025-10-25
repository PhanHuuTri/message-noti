// user model class

import 'package:demo_noti/utils/permission_utils.dart';

/// A class that represents a user.
class User {
  final String id;
  final String name;
  final String username;
  final String password; // In a real application, never save the password as plain text
  final String email;
  final UserRole role;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.email,
    required this.role,
  });
}
