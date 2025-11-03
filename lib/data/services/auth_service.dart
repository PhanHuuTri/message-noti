// Example AuthService
// You should implement your actual authentication logic here,
// perhaps using a Stream to notify of auth state changes.
import 'package:demo_noti/data/models/user_model.dart';
import 'package:demo_noti/utils/permission_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

abstract class AuthService with ChangeNotifier {
  bool get isLoggedIn;
  User? get currentUser;
  Future<bool> login(String username, String password);
  Future<void> logout();
}

class MockAuthService extends ChangeNotifier implements AuthService {
  User? _currentUser;
  final _storage = GetStorage();
  static const _userKey = 'currentUser';

  @override
  User? get currentUser => _currentUser;
  @override
  bool get isLoggedIn => _currentUser != null;


  // --- TEMPORARY USER DATA (MOCK DATA) ---
  // This is where you define the accounts for login.
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
      name: 'Level 2 Agent Minh Anh',
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
  MockAuthService() {
    _loadUserFromStorage();
  }
  void _loadUserFromStorage() {
    try {
      final userJson = _storage.read(_userKey);
      if (userJson != null) {
        _currentUser = User.fromJsonString(userJson);
        notifyListeners();
      }
    } catch (e) {
      _storage.remove(_userKey);
      _currentUser = null;
    }
  }

  /// Mock login function.
  @override
  Future<bool> login(String username, String password) async {
    // Find the user in the temporary data list
    final user = _users.firstWhere(
      (u) => u.username == username && u.password == password,
      orElse: () => throw Exception('Incorrect username or password'),
    );

    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // Simulate network latency

    _currentUser = user;

    await _storage.write(_userKey, user.toJsonString());
    notifyListeners(); // Notify listening widgets of state change
    return true;
  }


  /// Mock logout function.
  @override
  Future<void> logout() async {
    await Future.delayed(
      const Duration(milliseconds: 200),
    ); // Simulate network latency
    _currentUser = null;

    await _storage.remove(_userKey);

    notifyListeners(); // Notify state change
  }
}
