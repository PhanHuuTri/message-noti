
import 'package:demo_noti/utils/permission_utils.dart';

/// Lớp đại diện cho một người dùng.
class User {
  final String id;
  final String name;
  final String username;
  final String password; // Trong ứng dụng thật, không bao giờ lưu password dạng text
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
