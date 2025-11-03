// user model class

import 'dart:convert';

import 'package:demo_noti/utils/permission_utils.dart';

/// A class that represents a user.
class User {
  final String id;
  final String name;
  final String username;
  final String password;
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      role: UserRole.values.firstWhere(
        (e) => e.name == json['role'],
        orElse: () => UserRole.nhanVien,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'password': password,
      'role': role.name,
    };
  }

  String toJsonString() => json.encode(toJson());

  factory User.fromJsonString(String jsonString) {
    return User.fromJson(json.decode(jsonString));
  }
}
