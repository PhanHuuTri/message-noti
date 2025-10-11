
// Example AuthService
// You should implement your actual authentication logic here,
// perhaps using a Stream to notify of auth state changes.
import 'package:flutter/widgets.dart';

abstract class AuthService with ChangeNotifier {
  bool get isLoggedIn;
  Future<void> login();
  Future<void> logout();
}

class MockAuthService extends AuthService {
  bool _isLoggedIn = false;

  @override
  bool get isLoggedIn => _isLoggedIn;

  @override
  Future<void> login() async {
    _isLoggedIn = true;
    notifyListeners();
  }

  @override
  Future<void> logout() async {
    _isLoggedIn = false;
    notifyListeners();
  }
}