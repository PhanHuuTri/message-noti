// Example AuthService
// You should implement your actual authentication logic here,
// perhaps using a Stream to notify of auth state changes.
import 'package:demo_noti/data/users-data.dart';
import 'package:demo_noti/utils/permission_utils.dart';
import 'package:flutter/widgets.dart';

abstract class AuthService with ChangeNotifier {
  bool get isLoggedIn;
  User? get currentUser;
  Future<bool> login(String username, String password);
  Future<void> logout();
}

class MockAuthService extends ChangeNotifier implements AuthService {
  User? _currentUser;

  @override
  User? get currentUser => _currentUser;
  @override
  bool get isLoggedIn => _currentUser != null;

  // --- DỮ LIỆU NGƯỜI DÙNG TẠM THỜI (MOCK DATA) ---
  // Đây là nơi bạn định nghĩa các tài khoản để đăng nhập.
  static final List<User> _users = [
    const User(
      id: 'npp01',
      name: 'NPP Toàn Thắng',
      email: 'npp@example.com',
      username: 'npp',
      password: '123',
      role: UserRole.npp,
    ),
    const User(
      id: 'tc01',
      name: 'Đại lý cấp 2 Minh Anh',
      email: 'thucap@example.com',
      username: 'thucap',
      password: '123',
      role: UserRole.thuCap,
    ),
    const User(
      id: 'c201',
      name: 'Cửa hàng tiện lợi 24h',
      email: 'c2@example.com',
      username: 'c2',
      password: '123',
      role: UserRole.c2,
    ),
    const User(
      id: 'nv01',
      name: 'Nguyễn Văn A',
      email: 'nhanvien@example.com',
      username: 'nhanvien',
      password: '123',
      role: UserRole.nhanVien,
    ),
  ];

  /// Hàm giả lập đăng nhập.
  @override
  Future<bool> login(String username, String password) async {
    // Tìm người dùng trong danh sách dữ liệu tạm
    final user = _users.firstWhere(
      (u) => u.username == username && u.password == password,
      orElse: () => throw Exception('Tên đăng nhập hoặc mật khẩu không đúng'),
    );

    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // Giả lập độ trễ mạng

    _currentUser = user;
    notifyListeners(); // Thông báo cho các widget đang lắng nghe về sự thay đổi trạng thái
    return true;
  }

  /// Hàm giả lập đăng xuất.
  @override
  Future<void> logout() async {
    await Future.delayed(
      const Duration(milliseconds: 200),
    ); // Giả lập độ trễ mạng
    _currentUser = null;
    notifyListeners(); // Thông báo thay đổi trạng thái
  }
}
