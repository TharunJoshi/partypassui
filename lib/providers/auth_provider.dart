import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/session_manager.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService authService = AuthService();

  // User-related state
  String? _token;
  Map<String, dynamic>? _user;

  // Loading state
  bool _isLoading = false;

  // Getters
  bool get isAuthenticated => _token != null;
  Map<String, dynamic>? get user => _user;
  bool get isLoading => _isLoading;

  // Setters
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Login
  Future<void> login(String email, String password) async {
    setLoading(true);
    try {
      final response = await authService.login(email, password);
      _token = response['token'];
      _user = response;
      await SessionManager.saveToken(_token!);
      notifyListeners();
    } finally {
      setLoading(false);
    }
  }

  // Logout
  Future<void> logout() async {
    _token = null;
    _user = null;
    await SessionManager.clearToken();
    notifyListeners();
  }

  // Check session
  Future<void> checkSession() async {
    _token = await SessionManager.getToken();
    if (_token == null) {
      _user = null;
    }
    notifyListeners();
  }
}
